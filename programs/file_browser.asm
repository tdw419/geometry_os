; file_browser.asm -- File Browser GUI App for Geometry OS
;
; Proves: LS, OPEN, READ, CLOSE, UNLINK (VFS file operations),
;         TEXT rendering, HITSET/HITQ (mouse), IKEY (keyboard), FRAME.
;
; Three modes via MODE at 0x500:
;   0 = list view (VFS files, click to open, D to delete)
;   1 = content view (file contents, BACK to return)
;   2 = delete confirm (Y to delete, N to cancel)
;
; RAM Layout:
;   0x400-0x41F  filename address table (8 entries)
;   0x500       mode
;   0x504       file count
;   0x508       temp fd
;   0x50C       delete target row (0-7, 255=select mode)
;   0x600-0x9FF  file list buffer (LS output)
;   0xA00-0xDFF  content buffer (READ output)
;   0xE00-0xE7F  string buffer for labels
;
; No colons in comments (assembler pitfall)

#define FNAME_TABLE  0x400
#define MODE         0x500
#define FILE_COUNT   0x504
#define TEMP_FD      0x508
#define DEL_TARGET   0x50C
#define FILE_BUF     0x600
#define CONTENT_BUF  0xA00
#define STR_BUF      0xE00
#define TITLE_Y      6
#define ROW_BASE_Y   30
#define ROW_H        22
#define ROW_X        10
#define ROW_W        236
#define MAX_ROWS     6
#define BACK_Y       240

; ── INIT ──────────────────────────────────────
LDI r1, 1
LDI r2, 0x1a1a2e
FILL r2

LDI r20, MODE
LDI r2, 0
STORE r20, r2

LDI r20, DEL_TARGET
LDI r2, 0
STORE r20, r2

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 8 hit regions for rows
LDI r1, ROW_X
LDI r3, ROW_W
LDI r4, ROW_H

LDI r2, 30
HITSET r1, r2, r3, r4, 1
LDI r2, 52
HITSET r1, r2, r3, r4, 2
LDI r2, 74
HITSET r1, r2, r3, r4, 3
LDI r2, 96
HITSET r1, r2, r3, r4, 4
LDI r2, 118
HITSET r1, r2, r3, r4, 5
LDI r2, 140
HITSET r1, r2, r3, r4, 6

; BACK button
LDI r1, 10
LDI r2, BACK_Y
LDI r3, 60
LDI r4, 16
HITSET r1, r2, r3, r4, 99

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
    LOAD r6, r20
    CMPI r6, 0
    JZ r0, draw_list
    CMPI r6, 1
    JZ r0, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r2, 0x1a1a2e
    FILL r2

    ; Title bar
    LDI r5, 0x2a2a4a
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 24
    RECTF r1, r2, r3, r4, r5

    LDI r1, 10
    LDI r2, TITLE_Y
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; DEL button
    LDI r5, 0x884422
    LDI r1, 196
    LDI r2, 4
    LDI r3, 50
    LDI r4, 16
    RECTF r1, r2, r3, r4, r5
    LDI r1, 210
    LDI r2, TITLE_Y
    LDI r3, STR_BUF
    ADDI r3, 32
    TEXT r1, r2, r3

    ; File rows
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    CMPI r22, MAX_ROWS
    BGE r0, rows_done
    LOAD r20, r23
    CMPI r20, 0
    JZ r0, rows_done

    ; Alternating bg
    LDI r6, 2
    MOD r22, r6
    CMPI r6, 0
    JZ r0, row_even
    LDI r5, 0x222244
    JMP row_bg
row_even:
    LDI r5, 0x1e1e3a
row_bg:
    LDI r1, ROW_X
    MOV r2, r24
    LDI r3, ROW_W
    LDI r4, ROW_H
    RECTF r1, r2, r3, r4, r5

    LDI r1, ROW_X
    ADDI r1, 4
    MOV r2, r24
    ADDI r2, 4
    TEXT r1, r2, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r6, ROW_H
    ADD r24, r6
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r2, 0x1a1a2e
    FILL r2

    LDI r5, 0x2a2a4a
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 24
    RECTF r1, r2, r3, r4, r5

    LDI r1, 10
    LDI r2, TITLE_Y
    LDI r3, STR_BUF
    ADDI r3, 16
    TEXT r1, r2, r3

    ; BACK button
    LDI r5, 0x555555
    LDI r1, 10
    LDI r2, BACK_Y
    LDI r3, 60
    LDI r4, 16
    RECTF r1, r2, r3, r4, r5
    LDI r1, 22
    LDI r2, BACK_Y
    ADDI r2, 4
    LDI r3, STR_BUF
    ADDI r3, 16
    TEXT r1, r2, r3

    ; Content
    LDI r1, 10
    LDI r2, 30
    LDI r3, CONTENT_BUF
    TEXT r1, r2, r3

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r2, 0x1a1a2e
    FILL r2

    ; Dialog box
    LDI r5, 0x2a2a4a
    LDI r1, 30
    LDI r2, 80
    LDI r3, 196
    LDI r4, 100
    RECTF r1, r2, r3, r4, r5

    ; Title
    LDI r1, 120
    LDI r2, 90
    LDI r3, STR_BUF
    ADDI r3, 32
    TEXT r1, r2, r3

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r0, del_no_name
    LDI r1, 40
    LDI r2, 120
    TEXT r1, r2, r20
del_no_name:

    ; [Y] green button (no text label, just color)
    LDI r5, 0x225522
    LDI r1, 50
    LDI r2, 150
    LDI r3, 70
    LDI r4, 20
    RECTF r1, r2, r3, r4, r5

    ; [N] red button
    LDI r5, 0x552222
    LDI r1, 140
    LDI r2, 150
    LDI r3, 70
    LDI r4, 20
    RECTF r1, r2, r3, r4, r5

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r10
    CMPI r10, 0
    JZ r0, chk_mouse

    LDI r20, MODE
    LOAD r6, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r6, 2
    JNZ r0, kb_list
    CMPI r10, 89
    JZ r0, do_unlink
    CMPI r10, 121
    JZ r0, do_unlink
    CMPI r10, 78
    JZ r0, do_cancel
    CMPI r10, 110
    JZ r0, do_cancel
    CMPI r10, 27
    JZ r0, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r6, 0
    JNZ r0, chk_mouse
    CMPI r10, 68
    JZ r0, chk_mouse
    CMPI r10, 100
    JNZ r0, chk_mouse
    LDI r20, DEL_TARGET
    LDI r2, 255
    STORE r20, r2
    JMP main_loop

chk_mouse:
    LDI r12, 0
    HITQ r12
    CMPI r12, 0
    JZ r0, main_loop

    LDI r20, MODE
    LOAD r6, r20
    CMPI r6, 0
    JZ r0, on_list_click
    CMPI r6, 1
    JZ r0, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r12, 99
    JZ r0, main_loop

    LDI r20, DEL_TARGET
    LOAD r6, r20
    CMPI r6, 255
    JNZ r0, on_open

    ; Delete select: validate row
    CMPI r12, 1
    BLT r0, main_loop
    CMPI r12, 6
    BGE r0, main_loop
    SUBI r12, 1
    LDI r23, FNAME_TABLE
    ADD r23, r12
    LOAD r20, r23
    CMPI r20, 0
    JZ r0, main_loop

    ; Enter delete confirm
    MOV r6, r12
    LDI r20, DEL_TARGET
    STORE r20, r6
    LDI r20, MODE
    LDI r2, 2
    STORE r20, r2
    JMP main_loop

on_open:
    CMPI r12, 1
    BLT r0, main_loop
    CMPI r12, 6
    BGE r0, main_loop
    SUBI r12, 1
    LDI r23, FNAME_TABLE
    ADD r23, r12
    LOAD r20, r23
    CMPI r20, 0
    JZ r0, main_loop

    ; Open and read
    LDI r6, 0
    OPEN r20, r6
    MOV r19, r0
    CMPI r0, 0xFFFFFFFF
    JZ r0, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r6, CONTENT_BUF
    LDI r7, 2048
    READ r19, r6, r7

    LDI r20, CONTENT_BUF
    ADD r20, r0
    LDI r2, 0
    STORE r20, r2

    CLOSE r19

    LDI r20, MODE
    LDI r2, 1
    STORE r20, r2
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r12, 99
    JNZ r0, main_loop
    LDI r20, MODE
    LDI r2, 0
    STORE r20, r2
    JMP main_loop

; ── Delete actions ──
do_unlink:
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r0, do_cancel
    UNLINK r20
do_cancel:
    LDI r20, MODE
    LDI r2, 0
    STORE r20, r2
    LDI r20, DEL_TARGET
    LDI r2, 0
    STORE r20, r2
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r0, r2, r20, r21, r22, r23
; ═══════════════════════════════════════════════
refresh_list:
    LDI r20, FILE_BUF
    LS r20
    LDI r21, FILE_COUNT
    STORE r21, r0

    LDI r20, FILE_BUF
    LDI r22, 0
    LDI r23, FNAME_TABLE

rl_scan:
    CMPI r22, MAX_ROWS
    BGE r0, rl_done
    LOAD r2, r20
    CMPI r2, 0
    JZ r0, rl_done

    STORE r23, r20
    ADDI r23, 1

rl_skip:
    LOAD r2, r20
    CMPI r2, 0
    JZ r0, rl_next
    ADDI r20, 1
    JMP rl_skip

rl_next:
    ADDI r20, 1
    ADDI r22, 1
    JMP rl_scan

rl_done:
    RET
