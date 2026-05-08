; DESCRIPTION: Render a colored object at the screen.

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
LDI r4, 1
LDI r3, 0x1a1a2e
FILL r3

LDI r20, MODE
LDI r3, 0
STORE r20, r3

LDI r20, DEL_TARGET
LDI r3, 0
STORE r20, r3

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r4, ROW_X
LDI r12, ROW_W
LDI r6, ROW_H

LDI r3, 30
HITSET r4, r3, r12, r6, 1
LDI r3, 52
HITSET r4, r3, r12, r6, 2
LDI r3, 74
HITSET r4, r3, r12, r6, 3
LDI r3, 96
HITSET r4, r3, r12, r6, 4
LDI r3, 118
HITSET r4, r3, r12, r6, 5
LDI r3, 140
HITSET r4, r3, r12, r6, 6

; BACK button
LDI r4, 10
LDI r3, BACK_Y
LDI r12, 60
LDI r6, 16
HITSET r4, r3, r12, r6, 99

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
    LDI r4, 1
    LDI r20, MODE
    LOAD r0, r20
    CMPI r0, 0
    JZ r1, draw_list
    CMPI r0, 1
    JZ r1, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r3, 0x1a1a2e
    FILL r3

    ; Title bar
    LDI r14, 0x2a2a4a
    LDI r4, 0
    LDI r3, 0
    LDI r12, 256
    LDI r6, 24
    RECTF r4, r3, r12, r6, r14

    LDI r4, 10
    LDI r3, TITLE_Y
    LDI r12, STR_BUF
    TEXT r4, r3, r12

    ; DEL button
    LDI r14, 0x884422
    LDI r4, 196
    LDI r3, 4
    LDI r12, 50
    LDI r6, 16
    RECTF r4, r3, r12, r6, r14
    LDI r4, 210
    LDI r3, TITLE_Y
    LDI r12, STR_BUF
    ADDI r12, 32
    TEXT r4, r3, r12

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r1, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, rows_done

    ; Alternating bg
    LDI r0, 2
    MOD r22, r0
    CMPI r0, 0
    JZ r1, row_even
    LDI r14, 0x222244
    JMP row_bg
row_even:
    LDI r14, 0x1e1e3a
row_bg:
    LDI r4, ROW_X
    MOV r3, r24
    LDI r12, ROW_W
    LDI r6, ROW_H
    RECTF r4, r3, r12, r6, r14

    ; Filename
    LDI r4, ROW_X
    ADDI r4, 4
    MOV r3, r24
    ADDI r3, 4
    TEXT r4, r3, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r5, r21
    CMPI r5, 0xFFFFFFFF
    JZ r1, skip_size
    CMPI r5, 0
    JZ r1, skip_size
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
    LDI r4, SIZE_X
    MOV r3, r24
    ADDI r3, 4
    LDI r12, SIZE_STR_BUF
    TEXT r4, r3, r12
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r0, ROW_H
    ADD r24, r0
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r3, 0x1a1a2e
    FILL r3

    LDI r14, 0x2a2a4a
    LDI r4, 0
    LDI r3, 0
    LDI r12, 256
    LDI r6, 24
    RECTF r4, r3, r12, r6, r14

    LDI r4, 10
    LDI r3, TITLE_Y
    LDI r12, STR_BUF
    ADDI r12, 16
    TEXT r4, r3, r12

    ; BACK button
    LDI r14, 0x555555
    LDI r4, 10
    LDI r3, BACK_Y
    LDI r12, 60
    LDI r6, 16
    RECTF r4, r3, r12, r6, r14
    LDI r4, 22
    LDI r3, BACK_Y
    ADDI r3, 4
    LDI r12, STR_BUF
    ADDI r12, 16
    TEXT r4, r3, r12

    ; Content
    LDI r4, 10
    LDI r3, 30
    LDI r12, CONTENT_BUF
    TEXT r4, r3, r12

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r3, 0x1a1a2e
    FILL r3

    ; Dialog box
    LDI r14, 0x2a2a4a
    LDI r4, 30
    LDI r3, 80
    LDI r12, 196
    LDI r6, 100
    RECTF r4, r3, r12, r6, r14

    ; Title
    LDI r4, 120
    LDI r3, 90
    LDI r12, STR_BUF
    ADDI r12, 32
    TEXT r4, r3, r12

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, del_no_name
    LDI r4, 40
    LDI r3, 120
    TEXT r4, r3, r20
del_no_name:

    ; [Y] green button
    LDI r14, 0x225522
    LDI r4, 50
    LDI r3, 150
    LDI r12, 70
    LDI r6, 20
    RECTF r4, r3, r12, r6, r14

    ; [N] red button
    LDI r14, 0x552222
    LDI r4, 140
    LDI r3, 150
    LDI r12, 70
    LDI r6, 20
    RECTF r4, r3, r12, r6, r14

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r13
    CMPI r13, 0
    JZ r1, chk_mouse

    LDI r20, MODE
    LOAD r0, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r0, 2
    JNZ r1, kb_list
    CMPI r13, 89
    JZ r1, do_unlink
    CMPI r13, 121
    JZ r1, do_unlink
    CMPI r13, 78
    JZ r1, do_cancel
    CMPI r13, 110
    JZ r1, do_cancel
    CMPI r13, 27
    JZ r1, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r0, 0
    JNZ r1, chk_mouse
    CMPI r13, 68
    JZ r1, chk_mouse
    CMPI r13, 100
    JNZ r1, chk_mouse
    LDI r20, DEL_TARGET
    LDI r3, 255
    STORE r20, r3
    JMP main_loop

chk_mouse:
    LDI r2, 0
    HITQ r2
    CMPI r2, 0
    JZ r1, main_loop

    LDI r20, MODE
    LOAD r0, r20
    CMPI r0, 0
    JZ r1, on_list_click
    CMPI r0, 1
    JZ r1, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r2, 99
    JZ r1, main_loop

    LDI r20, DEL_TARGET
    LOAD r0, r20
    CMPI r0, 255
    JNZ r1, on_open

    ; Delete select: validate row
    CMPI r2, 1
    BLT r1, main_loop
    CMPI r2, 6
    BGE r1, main_loop
    SUBI r2, 1
    LDI r23, FNAME_TABLE
    ADD r23, r2
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, main_loop

    ; Enter delete confirm
    MOV r0, r2
    LDI r20, DEL_TARGET
    STORE r20, r0
    LDI r20, MODE
    LDI r3, 2
    STORE r20, r3
    JMP main_loop

on_open:
    CMPI r2, 1
    BLT r1, main_loop
    CMPI r2, 6
    BGE r1, main_loop
    SUBI r2, 1
    LDI r23, FNAME_TABLE
    ADD r23, r2
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, main_loop

    ; Open and read
    LDI r0, 0
    OPEN r20, r0
    MOV r19, r1
    CMPI r1, 0xFFFFFFFF
    JZ r1, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r0, CONTENT_BUF
    LDI r8, 2048
    READ r19, r0, r8

    LDI r20, CONTENT_BUF
    ADD r20, r1
    LDI r3, 0
    STORE r20, r3

    CLOSE r19

    LDI r20, MODE
    LDI r3, 1
    STORE r20, r3
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r2, 99
    JNZ r1, main_loop
    LDI r20, MODE
    LDI r3, 0
    STORE r20, r3
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r3, 0
    STORE r20, r3
    LDI r20, DEL_TARGET
    LDI r3, 0
    STORE r20, r3
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r1, r3, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r1

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r1, rl_done
    LOAD r3, r20
    CMPI r3, 0
    JZ r1, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r1

rl_skip:
    LOAD r3, r20
    CMPI r3, 0
    JZ r1, rl_next
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
; Converts r5 (u32) to decimal string at r20
; Clobbers: r5-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r5, its_zero

its_loop:
    MOV r18, r5
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r5, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r5, its_loop

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
