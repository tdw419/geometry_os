; DESCRIPTION: This GeOS assembly code implements a file browser GUI application with list, content, and delete confirmation modes. It uses VFS operations like LS, OPEN, READ, CLOSE, UNLINK, and VSTAT to manage files, renders text for display, handles mouse and keyboard input, and maintains state in RAM. The application supports displaying file lists, opening file contents, and confirming deletions through user interactions.

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
LDI r1, 1
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
LDI r1, ROW_X
LDI r0, ROW_W
LDI r6, ROW_H

LDI r4, 30
HITSET r1, r4, r0, r6, 1
LDI r4, 52
HITSET r1, r4, r0, r6, 2
LDI r4, 74
HITSET r1, r4, r0, r6, 3
LDI r4, 96
HITSET r1, r4, r0, r6, 4
LDI r4, 118
HITSET r1, r4, r0, r6, 5
LDI r4, 140
HITSET r1, r4, r0, r6, 6

; BACK button
LDI r1, 10
LDI r4, BACK_Y
LDI r0, 60
LDI r6, 16
HITSET r1, r4, r0, r6, 99

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
    LDI r1, 1
    LDI r20, MODE
    LOAD r5, r20
    CMPI r5, 0
    JZ r13, draw_list
    CMPI r5, 1
    JZ r13, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r4, 0x1a1a2e
    FILL r4

    ; Title bar
    LDI r2, 0x2a2a4a
    LDI r1, 0
    LDI r4, 0
    LDI r0, 256
    LDI r6, 24
    RECTF r1, r4, r0, r6, r2

    LDI r1, 10
    LDI r4, TITLE_Y
    LDI r0, STR_BUF
    TEXT r1, r4, r0

    ; DEL button
    LDI r2, 0x884422
    LDI r1, 196
    LDI r4, 4
    LDI r0, 50
    LDI r6, 16
    RECTF r1, r4, r0, r6, r2
    LDI r1, 210
    LDI r4, TITLE_Y
    LDI r0, STR_BUF
    ADDI r0, 32
    TEXT r1, r4, r0

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r13, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r13, rows_done

    ; Alternating bg
    LDI r5, 2
    MOD r22, r5
    CMPI r5, 0
    JZ r13, row_even
    LDI r2, 0x222244
    JMP row_bg
row_even:
    LDI r2, 0x1e1e3a
row_bg:
    LDI r1, ROW_X
    MOV r4, r24
    LDI r0, ROW_W
    LDI r6, ROW_H
    RECTF r1, r4, r0, r6, r2

    ; Filename
    LDI r1, ROW_X
    ADDI r1, 4
    MOV r4, r24
    ADDI r4, 4
    TEXT r1, r4, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r7, r21
    CMPI r7, 0xFFFFFFFF
    JZ r13, skip_size
    CMPI r7, 0
    JZ r13, skip_size
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
    LDI r1, SIZE_X
    MOV r4, r24
    ADDI r4, 4
    LDI r0, SIZE_STR_BUF
    TEXT r1, r4, r0
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r5, ROW_H
    ADD r24, r5
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r4, 0x1a1a2e
    FILL r4

    LDI r2, 0x2a2a4a
    LDI r1, 0
    LDI r4, 0
    LDI r0, 256
    LDI r6, 24
    RECTF r1, r4, r0, r6, r2

    LDI r1, 10
    LDI r4, TITLE_Y
    LDI r0, STR_BUF
    ADDI r0, 16
    TEXT r1, r4, r0

    ; BACK button
    LDI r2, 0x555555
    LDI r1, 10
    LDI r4, BACK_Y
    LDI r0, 60
    LDI r6, 16
    RECTF r1, r4, r0, r6, r2
    LDI r1, 22
    LDI r4, BACK_Y
    ADDI r4, 4
    LDI r0, STR_BUF
    ADDI r0, 16
    TEXT r1, r4, r0

    ; Content
    LDI r1, 10
    LDI r4, 30
    LDI r0, CONTENT_BUF
    TEXT r1, r4, r0

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r4, 0x1a1a2e
    FILL r4

    ; Dialog box
    LDI r2, 0x2a2a4a
    LDI r1, 30
    LDI r4, 80
    LDI r0, 196
    LDI r6, 100
    RECTF r1, r4, r0, r6, r2

    ; Title
    LDI r1, 120
    LDI r4, 90
    LDI r0, STR_BUF
    ADDI r0, 32
    TEXT r1, r4, r0

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r13, del_no_name
    LDI r1, 40
    LDI r4, 120
    TEXT r1, r4, r20
del_no_name:

    ; [Y] green button
    LDI r2, 0x225522
    LDI r1, 50
    LDI r4, 150
    LDI r0, 70
    LDI r6, 20
    RECTF r1, r4, r0, r6, r2

    ; [N] red button
    LDI r2, 0x552222
    LDI r1, 140
    LDI r4, 150
    LDI r0, 70
    LDI r6, 20
    RECTF r1, r4, r0, r6, r2

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r3
    CMPI r3, 0
    JZ r13, chk_mouse

    LDI r20, MODE
    LOAD r5, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r5, 2
    JNZ r13, kb_list
    CMPI r3, 89
    JZ r13, do_unlink
    CMPI r3, 121
    JZ r13, do_unlink
    CMPI r3, 78
    JZ r13, do_cancel
    CMPI r3, 110
    JZ r13, do_cancel
    CMPI r3, 27
    JZ r13, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r5, 0
    JNZ r13, chk_mouse
    CMPI r3, 68
    JZ r13, chk_mouse
    CMPI r3, 100
    JNZ r13, chk_mouse
    LDI r20, DEL_TARGET
    LDI r4, 255
    STORE r20, r4
    JMP main_loop

chk_mouse:
    LDI r8, 0
    HITQ r8
    CMPI r8, 0
    JZ r13, main_loop

    LDI r20, MODE
    LOAD r5, r20
    CMPI r5, 0
    JZ r13, on_list_click
    CMPI r5, 1
    JZ r13, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r8, 99
    JZ r13, main_loop

    LDI r20, DEL_TARGET
    LOAD r5, r20
    CMPI r5, 255
    JNZ r13, on_open

    ; Delete select: validate row
    CMPI r8, 1
    BLT r13, main_loop
    CMPI r8, 6
    BGE r13, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r13, main_loop

    ; Enter delete confirm
    MOV r5, r8
    LDI r20, DEL_TARGET
    STORE r20, r5
    LDI r20, MODE
    LDI r4, 2
    STORE r20, r4
    JMP main_loop

on_open:
    CMPI r8, 1
    BLT r13, main_loop
    CMPI r8, 6
    BGE r13, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r13, main_loop

    ; Open and read
    LDI r5, 0
    OPEN r20, r5
    MOV r19, r13
    CMPI r13, 0xFFFFFFFF
    JZ r13, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r5, CONTENT_BUF
    LDI r9, 2048
    READ r19, r5, r9

    LDI r20, CONTENT_BUF
    ADD r20, r13
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
    JNZ r13, main_loop
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
    JZ r13, do_cancel
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
; Clobbers: r13, r4, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r13

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r13, rl_done
    LOAD r4, r20
    CMPI r4, 0
    JZ r13, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r13

rl_skip:
    LOAD r4, r20
    CMPI r4, 0
    JZ r13, rl_next
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
; Converts r7 (u32) to decimal string at r20
; Clobbers: r7-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r7, its_zero

its_loop:
    MOV r18, r7
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r7, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r7, its_loop

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
