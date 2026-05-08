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
LDI r13, 1
LDI r1, 0x1a1a2e
FILL r1

LDI r20, MODE
LDI r1, 0
STORE r20, r1

LDI r20, DEL_TARGET
LDI r1, 0
STORE r20, r1

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r13, ROW_X
LDI r0, ROW_W
LDI r7, ROW_H

LDI r1, 30
HITSET r13, r1, r0, r7, 1
LDI r1, 52
HITSET r13, r1, r0, r7, 2
LDI r1, 74
HITSET r13, r1, r0, r7, 3
LDI r1, 96
HITSET r13, r1, r0, r7, 4
LDI r1, 118
HITSET r13, r1, r0, r7, 5
LDI r1, 140
HITSET r13, r1, r0, r7, 6

; BACK button
LDI r13, 10
LDI r1, BACK_Y
LDI r0, 60
LDI r7, 16
HITSET r13, r1, r0, r7, 99

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
    LDI r13, 1
    LDI r20, MODE
    LOAD r10, r20
    CMPI r10, 0
    JZ r14, draw_list
    CMPI r10, 1
    JZ r14, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r1, 0x1a1a2e
    FILL r1

    ; Title bar
    LDI r3, 0x2a2a4a
    LDI r13, 0
    LDI r1, 0
    LDI r0, 256
    LDI r7, 24
    RECTF r13, r1, r0, r7, r3

    LDI r13, 10
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    TEXT r13, r1, r0

    ; DEL button
    LDI r3, 0x884422
    LDI r13, 196
    LDI r1, 4
    LDI r0, 50
    LDI r7, 16
    RECTF r13, r1, r0, r7, r3
    LDI r13, 210
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    ADDI r0, 32
    TEXT r13, r1, r0

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r14, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, rows_done

    ; Alternating bg
    LDI r10, 2
    MOD r22, r10
    CMPI r10, 0
    JZ r14, row_even
    LDI r3, 0x222244
    JMP row_bg
row_even:
    LDI r3, 0x1e1e3a
row_bg:
    LDI r13, ROW_X
    MOV r1, r24
    LDI r0, ROW_W
    LDI r7, ROW_H
    RECTF r13, r1, r0, r7, r3

    ; Filename
    LDI r13, ROW_X
    ADDI r13, 4
    MOV r1, r24
    ADDI r1, 4
    TEXT r13, r1, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r4, r21
    CMPI r4, 0xFFFFFFFF
    JZ r14, skip_size
    CMPI r4, 0
    JZ r14, skip_size
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
    LDI r13, SIZE_X
    MOV r1, r24
    ADDI r1, 4
    LDI r0, SIZE_STR_BUF
    TEXT r13, r1, r0
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r10, ROW_H
    ADD r24, r10
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r1, 0x1a1a2e
    FILL r1

    LDI r3, 0x2a2a4a
    LDI r13, 0
    LDI r1, 0
    LDI r0, 256
    LDI r7, 24
    RECTF r13, r1, r0, r7, r3

    LDI r13, 10
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    ADDI r0, 16
    TEXT r13, r1, r0

    ; BACK button
    LDI r3, 0x555555
    LDI r13, 10
    LDI r1, BACK_Y
    LDI r0, 60
    LDI r7, 16
    RECTF r13, r1, r0, r7, r3
    LDI r13, 22
    LDI r1, BACK_Y
    ADDI r1, 4
    LDI r0, STR_BUF
    ADDI r0, 16
    TEXT r13, r1, r0

    ; Content
    LDI r13, 10
    LDI r1, 30
    LDI r0, CONTENT_BUF
    TEXT r13, r1, r0

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r1, 0x1a1a2e
    FILL r1

    ; Dialog box
    LDI r3, 0x2a2a4a
    LDI r13, 30
    LDI r1, 80
    LDI r0, 196
    LDI r7, 100
    RECTF r13, r1, r0, r7, r3

    ; Title
    LDI r13, 120
    LDI r1, 90
    LDI r0, STR_BUF
    ADDI r0, 32
    TEXT r13, r1, r0

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, del_no_name
    LDI r13, 40
    LDI r1, 120
    TEXT r13, r1, r20
del_no_name:

    ; [Y] green button
    LDI r3, 0x225522
    LDI r13, 50
    LDI r1, 150
    LDI r0, 70
    LDI r7, 20
    RECTF r13, r1, r0, r7, r3

    ; [N] red button
    LDI r3, 0x552222
    LDI r13, 140
    LDI r1, 150
    LDI r0, 70
    LDI r7, 20
    RECTF r13, r1, r0, r7, r3

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r11
    CMPI r11, 0
    JZ r14, chk_mouse

    LDI r20, MODE
    LOAD r10, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r10, 2
    JNZ r14, kb_list
    CMPI r11, 89
    JZ r14, do_unlink
    CMPI r11, 121
    JZ r14, do_unlink
    CMPI r11, 78
    JZ r14, do_cancel
    CMPI r11, 110
    JZ r14, do_cancel
    CMPI r11, 27
    JZ r14, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r10, 0
    JNZ r14, chk_mouse
    CMPI r11, 68
    JZ r14, chk_mouse
    CMPI r11, 100
    JNZ r14, chk_mouse
    LDI r20, DEL_TARGET
    LDI r1, 255
    STORE r20, r1
    JMP main_loop

chk_mouse:
    LDI r8, 0
    HITQ r8
    CMPI r8, 0
    JZ r14, main_loop

    LDI r20, MODE
    LOAD r10, r20
    CMPI r10, 0
    JZ r14, on_list_click
    CMPI r10, 1
    JZ r14, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r8, 99
    JZ r14, main_loop

    LDI r20, DEL_TARGET
    LOAD r10, r20
    CMPI r10, 255
    JNZ r14, on_open

    ; Delete select: validate row
    CMPI r8, 1
    BLT r14, main_loop
    CMPI r8, 6
    BGE r14, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, main_loop

    ; Enter delete confirm
    MOV r10, r8
    LDI r20, DEL_TARGET
    STORE r20, r10
    LDI r20, MODE
    LDI r1, 2
    STORE r20, r1
    JMP main_loop

on_open:
    CMPI r8, 1
    BLT r14, main_loop
    CMPI r8, 6
    BGE r14, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, main_loop

    ; Open and read
    LDI r10, 0
    OPEN r20, r10
    MOV r19, r14
    CMPI r14, 0xFFFFFFFF
    JZ r14, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r10, CONTENT_BUF
    LDI r6, 2048
    READ r19, r10, r6

    LDI r20, CONTENT_BUF
    ADD r20, r14
    LDI r1, 0
    STORE r20, r1

    CLOSE r19

    LDI r20, MODE
    LDI r1, 1
    STORE r20, r1
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r8, 99
    JNZ r14, main_loop
    LDI r20, MODE
    LDI r1, 0
    STORE r20, r1
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r1, 0
    STORE r20, r1
    LDI r20, DEL_TARGET
    LDI r1, 0
    STORE r20, r1
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r14, r1, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r14

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r14, rl_done
    LOAD r1, r20
    CMPI r1, 0
    JZ r14, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r14

rl_skip:
    LOAD r1, r20
    CMPI r1, 0
    JZ r14, rl_next
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
; Converts r4 (u32) to decimal string at r20
; Clobbers: r4-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r4, its_zero

its_loop:
    MOV r18, r4
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r4, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r4, its_loop

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
