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
LDI r7, 1
LDI r0, 0x1a1a2e
FILL r0

LDI r20, MODE
LDI r0, 0
STORE r20, r0

LDI r20, DEL_TARGET
LDI r0, 0
STORE r20, r0

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r7, ROW_X
LDI r8, ROW_W
LDI r6, ROW_H

LDI r0, 30
HITSET r7, r0, r8, r6, 1
LDI r0, 52
HITSET r7, r0, r8, r6, 2
LDI r0, 74
HITSET r7, r0, r8, r6, 3
LDI r0, 96
HITSET r7, r0, r8, r6, 4
LDI r0, 118
HITSET r7, r0, r8, r6, 5
LDI r0, 140
HITSET r7, r0, r8, r6, 6

; BACK button
LDI r7, 10
LDI r0, BACK_Y
LDI r8, 60
LDI r6, 16
HITSET r7, r0, r8, r6, 99

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
    LDI r7, 1
    LDI r20, MODE
    LOAD r3, r20
    CMPI r3, 0
    JZ r5, draw_list
    CMPI r3, 1
    JZ r5, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r0, 0x1a1a2e
    FILL r0

    ; Title bar
    LDI r1, 0x2a2a4a
    LDI r7, 0
    LDI r0, 0
    LDI r8, 256
    LDI r6, 24
    RECTF r7, r0, r8, r6, r1

    LDI r7, 10
    LDI r0, TITLE_Y
    LDI r8, STR_BUF
    TEXT r7, r0, r8

    ; DEL button
    LDI r1, 0x884422
    LDI r7, 196
    LDI r0, 4
    LDI r8, 50
    LDI r6, 16
    RECTF r7, r0, r8, r6, r1
    LDI r7, 210
    LDI r0, TITLE_Y
    LDI r8, STR_BUF
    ADDI r8, 32
    TEXT r7, r0, r8

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r5, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, rows_done

    ; Alternating bg
    LDI r3, 2
    MOD r22, r3
    CMPI r3, 0
    JZ r5, row_even
    LDI r1, 0x222244
    JMP row_bg
row_even:
    LDI r1, 0x1e1e3a
row_bg:
    LDI r7, ROW_X
    MOV r0, r24
    LDI r8, ROW_W
    LDI r6, ROW_H
    RECTF r7, r0, r8, r6, r1

    ; Filename
    LDI r7, ROW_X
    ADDI r7, 4
    MOV r0, r24
    ADDI r0, 4
    TEXT r7, r0, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r10, r21
    CMPI r10, 0xFFFFFFFF
    JZ r5, skip_size
    CMPI r10, 0
    JZ r5, skip_size
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
    LDI r7, SIZE_X
    MOV r0, r24
    ADDI r0, 4
    LDI r8, SIZE_STR_BUF
    TEXT r7, r0, r8
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r3, ROW_H
    ADD r24, r3
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r0, 0x1a1a2e
    FILL r0

    LDI r1, 0x2a2a4a
    LDI r7, 0
    LDI r0, 0
    LDI r8, 256
    LDI r6, 24
    RECTF r7, r0, r8, r6, r1

    LDI r7, 10
    LDI r0, TITLE_Y
    LDI r8, STR_BUF
    ADDI r8, 16
    TEXT r7, r0, r8

    ; BACK button
    LDI r1, 0x555555
    LDI r7, 10
    LDI r0, BACK_Y
    LDI r8, 60
    LDI r6, 16
    RECTF r7, r0, r8, r6, r1
    LDI r7, 22
    LDI r0, BACK_Y
    ADDI r0, 4
    LDI r8, STR_BUF
    ADDI r8, 16
    TEXT r7, r0, r8

    ; Content
    LDI r7, 10
    LDI r0, 30
    LDI r8, CONTENT_BUF
    TEXT r7, r0, r8

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r0, 0x1a1a2e
    FILL r0

    ; Dialog box
    LDI r1, 0x2a2a4a
    LDI r7, 30
    LDI r0, 80
    LDI r8, 196
    LDI r6, 100
    RECTF r7, r0, r8, r6, r1

    ; Title
    LDI r7, 120
    LDI r0, 90
    LDI r8, STR_BUF
    ADDI r8, 32
    TEXT r7, r0, r8

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, del_no_name
    LDI r7, 40
    LDI r0, 120
    TEXT r7, r0, r20
del_no_name:

    ; [Y] green button
    LDI r1, 0x225522
    LDI r7, 50
    LDI r0, 150
    LDI r8, 70
    LDI r6, 20
    RECTF r7, r0, r8, r6, r1

    ; [N] red button
    LDI r1, 0x552222
    LDI r7, 140
    LDI r0, 150
    LDI r8, 70
    LDI r6, 20
    RECTF r7, r0, r8, r6, r1

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r11
    CMPI r11, 0
    JZ r5, chk_mouse

    LDI r20, MODE
    LOAD r3, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r3, 2
    JNZ r5, kb_list
    CMPI r11, 89
    JZ r5, do_unlink
    CMPI r11, 121
    JZ r5, do_unlink
    CMPI r11, 78
    JZ r5, do_cancel
    CMPI r11, 110
    JZ r5, do_cancel
    CMPI r11, 27
    JZ r5, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r3, 0
    JNZ r5, chk_mouse
    CMPI r11, 68
    JZ r5, chk_mouse
    CMPI r11, 100
    JNZ r5, chk_mouse
    LDI r20, DEL_TARGET
    LDI r0, 255
    STORE r20, r0
    JMP main_loop

chk_mouse:
    LDI r15, 0
    HITQ r15
    CMPI r15, 0
    JZ r5, main_loop

    LDI r20, MODE
    LOAD r3, r20
    CMPI r3, 0
    JZ r5, on_list_click
    CMPI r3, 1
    JZ r5, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r15, 99
    JZ r5, main_loop

    LDI r20, DEL_TARGET
    LOAD r3, r20
    CMPI r3, 255
    JNZ r5, on_open

    ; Delete select: validate row
    CMPI r15, 1
    BLT r5, main_loop
    CMPI r15, 6
    BGE r5, main_loop
    SUBI r15, 1
    LDI r23, FNAME_TABLE
    ADD r23, r15
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, main_loop

    ; Enter delete confirm
    MOV r3, r15
    LDI r20, DEL_TARGET
    STORE r20, r3
    LDI r20, MODE
    LDI r0, 2
    STORE r20, r0
    JMP main_loop

on_open:
    CMPI r15, 1
    BLT r5, main_loop
    CMPI r15, 6
    BGE r5, main_loop
    SUBI r15, 1
    LDI r23, FNAME_TABLE
    ADD r23, r15
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, main_loop

    ; Open and read
    LDI r3, 0
    OPEN r20, r3
    MOV r19, r5
    CMPI r5, 0xFFFFFFFF
    JZ r5, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r3, CONTENT_BUF
    LDI r12, 2048
    READ r19, r3, r12

    LDI r20, CONTENT_BUF
    ADD r20, r5
    LDI r0, 0
    STORE r20, r0

    CLOSE r19

    LDI r20, MODE
    LDI r0, 1
    STORE r20, r0
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r15, 99
    JNZ r5, main_loop
    LDI r20, MODE
    LDI r0, 0
    STORE r20, r0
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r0, 0
    STORE r20, r0
    LDI r20, DEL_TARGET
    LDI r0, 0
    STORE r20, r0
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r5, r0, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r5

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r5, rl_done
    LOAD r0, r20
    CMPI r0, 0
    JZ r5, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r5

rl_skip:
    LOAD r0, r20
    CMPI r0, 0
    JZ r5, rl_next
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
; Converts r10 (u32) to decimal string at r20
; Clobbers: r10-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r10, its_zero

its_loop:
    MOV r18, r10
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r10, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r10, its_loop

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
