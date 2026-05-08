; DESCRIPTION: A colored object centered at the screen with fixed size.

; file_browser.asm -- File Browser GUI App for Geometry OS
;
; Proves: LS, OPEN, READ, CLOSE, UNLINK, VSTAT (VFS file operations),
;         TEXT rendering, HITSET/HITQ (mouse), IKEY (keyboard), FRAME.
;
; Three modes via MODE at 0x640:
;   0 = list view (VFS files, click to open, D to delete, shows file sizes)
;   1 = content view (file contents, BACK to return)
;   2 = delete confirm (Y to delete, N to cancel)
;
; RAM Layout:
;   0x600-0x61F  filename address table (8 entries)
;   0x620-0x63F  file size table (8 entries, u32 bytes per file)
;   0x640       mode
;   0x644       file count
;   0x648       temp fd
;   0x64C       delete target row (0-7, 255=select mode)
;   0x700-0xAFF  file list buffer (LS output)
;   0xC00-0xDFF  content buffer (READ output)
;   0xE00-0xE7F  string buffer for labels
;   0xE80-0xEBF  size string buffer (int_to_str output)
;
; No colons in comments (assembler pitfall)

#define FNAME_TABLE  0x600
#define SIZE_TABLE   0x620
#define MODE         0x640
#define FILE_COUNT   0x644
#define TEMP_FD      0x648
#define DEL_TARGET   0x64C
#define FILE_BUF     0x700
#define CONTENT_BUF  0xC00
#define STR_BUF      0xE00
#define SIZE_STR_BUF 0xE80
#define TITLE_Y      6
#define ROW_BASE_Y   30
#define ROW_H        22
#define ROW_X        10
#define ROW_W        236
#define MAX_ROWS     6
#define BACK_Y       240
#define SIZE_X       195

; ── INIT ──────────────────────────────────────
LDI r30, 0xFF00
LDI r6, 1
LDI r4, 0x1a1a2e
FILL r4

LDI r20, MODE
LDI r4, 0
STORE r20, r4

LDI r20, DEL_TARGET
LDI r4, 0
STORE r20, r4

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r6, ROW_X
LDI r11, ROW_W
LDI r10, ROW_H

LDI r4, 30
HITSET r6, r4, r11, r10, 1
LDI r4, 52
HITSET r6, r4, r11, r10, 2
LDI r4, 74
HITSET r6, r4, r11, r10, 3
LDI r4, 96
HITSET r6, r4, r11, r10, 4
LDI r4, 118
HITSET r6, r4, r11, r10, 5
LDI r4, 140
HITSET r6, r4, r11, r10, 6

; BACK button
LDI r6, 10
LDI r4, BACK_Y
LDI r11, 60
LDI r10, 16
HITSET r6, r4, r11, r10, 99

; Label strings
LDI r20, STR_BUF
STRO r20, "FILES"
LDI r20, STR_BUF
ADDI r20, 16
STRO r20, "BACK"
LDI r20, STR_BUF
ADDI r20, 32
STRO r20, "DEL?"

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r6, 1
    LDI r20, MODE
    LOAD r2, r20
    CMPI r2, 0
    JZ r9, draw_list
    CMPI r2, 1
    JZ r9, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r4, 0x1a1a2e
    FILL r4

    ; Title bar
    LDI r1, 0x2a2a4a
    LDI r6, 0
    LDI r4, 0
    LDI r11, 256
    LDI r10, 24
    RECTF r6, r4, r11, r10, r1

    LDI r6, 10
    LDI r4, TITLE_Y
    LDI r11, STR_BUF
    TEXT r6, r4, r11

    ; DEL button
    LDI r1, 0x884422
    LDI r6, 196
    LDI r4, 4
    LDI r11, 50
    LDI r10, 16
    RECTF r6, r4, r11, r10, r1
    LDI r6, 210
    LDI r4, TITLE_Y
    LDI r11, STR_BUF
    ADDI r11, 32
    TEXT r6, r4, r11

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r9, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r9, rows_done

    ; Alternating bg
    LDI r2, 2
    MOD r22, r2
    CMPI r2, 0
    JZ r9, row_even
    LDI r1, 0x222244
    JMP row_bg
row_even:
    LDI r1, 0x1e1e3a
row_bg:
    LDI r6, ROW_X
    MOV r4, r24
    LDI r11, ROW_W
    LDI r10, ROW_H
    RECTF r6, r4, r11, r10, r1

    ; Filename
    LDI r6, ROW_X
    ADDI r6, 4
    MOV r4, r24
    ADDI r4, 4
    TEXT r6, r4, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r3, r21
    CMPI r3, 0xFFFFFFFF
    JZ r9, skip_size
    CMPI r3, 0
    JZ r9, skip_size
    LDI r20, SIZE_STR_BUF
    PUSH r31
    CALL int_to_str
    POP r31
    ; Append "B" suffix
    LDI r18, 66
    STORE r20, r18
    ADDI r20, 1
    LDI r18, 0
    STORE r20, r18
    ; Draw size at right side of row
    LDI r6, SIZE_X
    MOV r4, r24
    ADDI r4, 4
    LDI r11, SIZE_STR_BUF
    TEXT r6, r4, r11
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r2, ROW_H
    ADD r24, r2
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r4, 0x1a1a2e
    FILL r4

    LDI r1, 0x2a2a4a
    LDI r6, 0
    LDI r4, 0
    LDI r11, 256
    LDI r10, 24
    RECTF r6, r4, r11, r10, r1

    LDI r6, 10
    LDI r4, TITLE_Y
    LDI r11, STR_BUF
    ADDI r11, 16
    TEXT r6, r4, r11

    ; BACK button
    LDI r1, 0x555555
    LDI r6, 10
    LDI r4, BACK_Y
    LDI r11, 60
    LDI r10, 16
    RECTF r6, r4, r11, r10, r1
    LDI r6, 22
    LDI r4, BACK_Y
    ADDI r4, 4
    LDI r11, STR_BUF
    ADDI r11, 16
    TEXT r6, r4, r11

    ; Content
    LDI r6, 10
    LDI r4, 30
    LDI r11, CONTENT_BUF
    TEXT r6, r4, r11

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r4, 0x1a1a2e
    FILL r4

    ; Dialog box
    LDI r1, 0x2a2a4a
    LDI r6, 30
    LDI r4, 80
    LDI r11, 196
    LDI r10, 100
    RECTF r6, r4, r11, r10, r1

    ; Title
    LDI r6, 120
    LDI r4, 90
    LDI r11, STR_BUF
    ADDI r11, 32
    TEXT r6, r4, r11

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r9, del_no_name
    LDI r6, 40
    LDI r4, 120
    TEXT r6, r4, r20
del_no_name:

    ; [Y] green button
    LDI r1, 0x225522
    LDI r6, 50
    LDI r4, 150
    LDI r11, 70
    LDI r10, 20
    RECTF r6, r4, r11, r10, r1

    ; [N] red button
    LDI r1, 0x552222
    LDI r6, 140
    LDI r4, 150
    LDI r11, 70
    LDI r10, 20
    RECTF r6, r4, r11, r10, r1

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r5
    CMPI r5, 0
    JZ r9, chk_mouse

    LDI r20, MODE
    LOAD r2, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r2, 2
    JNZ r9, kb_list
    CMPI r5, 89
    JZ r9, do_unlink
    CMPI r5, 121
    JZ r9, do_unlink
    CMPI r5, 78
    JZ r9, do_cancel
    CMPI r5, 110
    JZ r9, do_cancel
    CMPI r5, 27
    JZ r9, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r2, 0
    JNZ r9, chk_mouse
    CMPI r5, 68
    JZ r9, chk_mouse
    CMPI r5, 100
    JNZ r9, chk_mouse
    LDI r20, DEL_TARGET
    LDI r4, 255
    STORE r20, r4
    JMP main_loop

chk_mouse:
    LDI r8, 0
    HITQ r8
    CMPI r8, 0
    JZ r9, main_loop

    LDI r20, MODE
    LOAD r2, r20
    CMPI r2, 0
    JZ r9, on_list_click
    CMPI r2, 1
    JZ r9, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r8, 99
    JZ r9, main_loop

    LDI r20, DEL_TARGET
    LOAD r2, r20
    CMPI r2, 255
    JNZ r9, on_open

    ; Delete select: validate row
    CMPI r8, 1
    BLT r9, main_loop
    CMPI r8, 6
    BGE r9, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r9, main_loop

    ; Enter delete confirm
    MOV r2, r8
    LDI r20, DEL_TARGET
    STORE r20, r2
    LDI r20, MODE
    LDI r4, 2
    STORE r20, r4
    JMP main_loop

on_open:
    CMPI r8, 1
    BLT r9, main_loop
    CMPI r8, 6
    BGE r9, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r9, main_loop

    ; Open and read
    LDI r2, 0
    OPEN r20, r2
    MOV r19, r9
    CMPI r9, 0xFFFFFFFF
    JZ r9, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r2, CONTENT_BUF
    LDI r13, 2048
    READ r19, r2, r13

    LDI r20, CONTENT_BUF
    ADD r20, r9
    LDI r4, 0
    STORE r20, r4

    CLOSE r19

    LDI r20, MODE
    LDI r4, 1
    STORE r20, r4
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r8, 99
    JNZ r9, main_loop
    LDI r20, MODE
    LDI r4, 0
    STORE r20, r4
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r9, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r4, 0
    STORE r20, r4
    LDI r20, DEL_TARGET
    LDI r4, 0
    STORE r20, r4
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r9, r4, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r9

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r9, rl_done
    LOAD r4, r20
    CMPI r4, 0
    JZ r9, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r9

rl_skip:
    LOAD r4, r20
    CMPI r4, 0
    JZ r9, rl_next
    ADDI r20, 1
    JMP rl_skip

rl_next:
    ADDI r20, 1
    ADDI r22, 1
    JMP rl_scan

rl_done:
    RET

; ═══════════════════════════════════════════════
; INT TO STRING SUBROUTINE
; Converts r3 (u32) to decimal string at r20
; Clobbers: r3-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r3, its_zero

its_loop:
    MOV r18, r3
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r3, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r3, its_loop

its_write:
    POP r18
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r19, 1
    SUB r16, r19
    JNZ r16, its_write

    LDI r18, 0
    STORE r20, r18
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r31
    RET
