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
LDI r4, 1
LDI r14, 0x1a1a2e
FILL r14

LDI r20, MODE
LDI r14, 0
STORE r20, r14

LDI r20, DEL_TARGET
LDI r14, 0
STORE r20, r14

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r4, ROW_X
LDI r7, ROW_W
LDI r6, ROW_H

LDI r14, 30
HITSET r4, r14, r7, r6, 1
LDI r14, 52
HITSET r4, r14, r7, r6, 2
LDI r14, 74
HITSET r4, r14, r7, r6, 3
LDI r14, 96
HITSET r4, r14, r7, r6, 4
LDI r14, 118
HITSET r4, r14, r7, r6, 5
LDI r14, 140
HITSET r4, r14, r7, r6, 6

; BACK button
LDI r4, 10
LDI r14, BACK_Y
LDI r7, 60
LDI r6, 16
HITSET r4, r14, r7, r6, 99

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
    LOAD r15, r20
    CMPI r15, 0
    JZ r3, draw_list
    CMPI r15, 1
    JZ r3, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r14, 0x1a1a2e
    FILL r14

    ; Title bar
    LDI r1, 0x2a2a4a
    LDI r4, 0
    LDI r14, 0
    LDI r7, 256
    LDI r6, 24
    RECTF r4, r14, r7, r6, r1

    LDI r4, 10
    LDI r14, TITLE_Y
    LDI r7, STR_BUF
    TEXT r4, r14, r7

    ; DEL button
    LDI r1, 0x884422
    LDI r4, 196
    LDI r14, 4
    LDI r7, 50
    LDI r6, 16
    RECTF r4, r14, r7, r6, r1
    LDI r4, 210
    LDI r14, TITLE_Y
    LDI r7, STR_BUF
    ADDI r7, 32
    TEXT r4, r14, r7

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r3, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, rows_done

    ; Alternating bg
    LDI r15, 2
    MOD r22, r15
    CMPI r15, 0
    JZ r3, row_even
    LDI r1, 0x222244
    JMP row_bg
row_even:
    LDI r1, 0x1e1e3a
row_bg:
    LDI r4, ROW_X
    MOV r14, r24
    LDI r7, ROW_W
    LDI r6, ROW_H
    RECTF r4, r14, r7, r6, r1

    ; Filename
    LDI r4, ROW_X
    ADDI r4, 4
    MOV r14, r24
    ADDI r14, 4
    TEXT r4, r14, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r12, r21
    CMPI r12, 0xFFFFFFFF
    JZ r3, skip_size
    CMPI r12, 0
    JZ r3, skip_size
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
    MOV r14, r24
    ADDI r14, 4
    LDI r7, SIZE_STR_BUF
    TEXT r4, r14, r7
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r15, ROW_H
    ADD r24, r15
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r14, 0x1a1a2e
    FILL r14

    LDI r1, 0x2a2a4a
    LDI r4, 0
    LDI r14, 0
    LDI r7, 256
    LDI r6, 24
    RECTF r4, r14, r7, r6, r1

    LDI r4, 10
    LDI r14, TITLE_Y
    LDI r7, STR_BUF
    ADDI r7, 16
    TEXT r4, r14, r7

    ; BACK button
    LDI r1, 0x555555
    LDI r4, 10
    LDI r14, BACK_Y
    LDI r7, 60
    LDI r6, 16
    RECTF r4, r14, r7, r6, r1
    LDI r4, 22
    LDI r14, BACK_Y
    ADDI r14, 4
    LDI r7, STR_BUF
    ADDI r7, 16
    TEXT r4, r14, r7

    ; Content
    LDI r4, 10
    LDI r14, 30
    LDI r7, CONTENT_BUF
    TEXT r4, r14, r7

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r14, 0x1a1a2e
    FILL r14

    ; Dialog box
    LDI r1, 0x2a2a4a
    LDI r4, 30
    LDI r14, 80
    LDI r7, 196
    LDI r6, 100
    RECTF r4, r14, r7, r6, r1

    ; Title
    LDI r4, 120
    LDI r14, 90
    LDI r7, STR_BUF
    ADDI r7, 32
    TEXT r4, r14, r7

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, del_no_name
    LDI r4, 40
    LDI r14, 120
    TEXT r4, r14, r20
del_no_name:

    ; [Y] green button
    LDI r1, 0x225522
    LDI r4, 50
    LDI r14, 150
    LDI r7, 70
    LDI r6, 20
    RECTF r4, r14, r7, r6, r1

    ; [N] red button
    LDI r1, 0x552222
    LDI r4, 140
    LDI r14, 150
    LDI r7, 70
    LDI r6, 20
    RECTF r4, r14, r7, r6, r1

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r13
    CMPI r13, 0
    JZ r3, chk_mouse

    LDI r20, MODE
    LOAD r15, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r15, 2
    JNZ r3, kb_list
    CMPI r13, 89
    JZ r3, do_unlink
    CMPI r13, 121
    JZ r3, do_unlink
    CMPI r13, 78
    JZ r3, do_cancel
    CMPI r13, 110
    JZ r3, do_cancel
    CMPI r13, 27
    JZ r3, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r15, 0
    JNZ r3, chk_mouse
    CMPI r13, 68
    JZ r3, chk_mouse
    CMPI r13, 100
    JNZ r3, chk_mouse
    LDI r20, DEL_TARGET
    LDI r14, 255
    STORE r20, r14
    JMP main_loop

chk_mouse:
    LDI r8, 0
    HITQ r8
    CMPI r8, 0
    JZ r3, main_loop

    LDI r20, MODE
    LOAD r15, r20
    CMPI r15, 0
    JZ r3, on_list_click
    CMPI r15, 1
    JZ r3, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r8, 99
    JZ r3, main_loop

    LDI r20, DEL_TARGET
    LOAD r15, r20
    CMPI r15, 255
    JNZ r3, on_open

    ; Delete select: validate row
    CMPI r8, 1
    BLT r3, main_loop
    CMPI r8, 6
    BGE r3, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, main_loop

    ; Enter delete confirm
    MOV r15, r8
    LDI r20, DEL_TARGET
    STORE r20, r15
    LDI r20, MODE
    LDI r14, 2
    STORE r20, r14
    JMP main_loop

on_open:
    CMPI r8, 1
    BLT r3, main_loop
    CMPI r8, 6
    BGE r3, main_loop
    SUBI r8, 1
    LDI r23, FNAME_TABLE
    ADD r23, r8
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, main_loop

    ; Open and read
    LDI r15, 0
    OPEN r20, r15
    MOV r19, r3
    CMPI r3, 0xFFFFFFFF
    JZ r3, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r15, CONTENT_BUF
    LDI r11, 2048
    READ r19, r15, r11

    LDI r20, CONTENT_BUF
    ADD r20, r3
    LDI r14, 0
    STORE r20, r14

    CLOSE r19

    LDI r20, MODE
    LDI r14, 1
    STORE r20, r14
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r8, 99
    JNZ r3, main_loop
    LDI r20, MODE
    LDI r14, 0
    STORE r20, r14
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r14, 0
    STORE r20, r14
    LDI r20, DEL_TARGET
    LDI r14, 0
    STORE r20, r14
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r3, r14, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r3

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r3, rl_done
    LOAD r14, r20
    CMPI r14, 0
    JZ r3, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r3

rl_skip:
    LOAD r14, r20
    CMPI r14, 0
    JZ r3, rl_next
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
; Converts r12 (u32) to decimal string at r20
; Clobbers: r12-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r12, its_zero

its_loop:
    MOV r18, r12
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r12, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r12, its_loop

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
