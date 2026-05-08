; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r5, 1
LDI r13, 0x1a1a2e
FILL r13

LDI r20, MODE
LDI r13, 0
STORE r20, r13

LDI r20, DEL_TARGET
LDI r13, 0
STORE r20, r13

; List files and build table
PUSH r31
CALL refresh_list
POP r31

; Register 6 hit regions for rows
LDI r5, ROW_X
LDI r7, ROW_W
LDI r14, ROW_H

LDI r13, 30
HITSET r5, r13, r7, r14, 1
LDI r13, 52
HITSET r5, r13, r7, r14, 2
LDI r13, 74
HITSET r5, r13, r7, r14, 3
LDI r13, 96
HITSET r5, r13, r7, r14, 4
LDI r13, 118
HITSET r5, r13, r7, r14, 5
LDI r13, 140
HITSET r5, r13, r7, r14, 6

; BACK button
LDI r5, 10
LDI r13, BACK_Y
LDI r7, 60
LDI r14, 16
HITSET r5, r13, r7, r14, 99

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
    LDI r5, 1
    LDI r20, MODE
    LOAD r9, r20
    CMPI r9, 0
    JZ r1, draw_list
    CMPI r9, 1
    JZ r1, draw_content
    JMP draw_delete

; ═══════════════════════════════════════════════
; LIST VIEW (mode 0)
; ═══════════════════════════════════════════════
draw_list:
    LDI r13, 0x1a1a2e
    FILL r13

    ; Title bar
    LDI r6, 0x2a2a4a
    LDI r5, 0
    LDI r13, 0
    LDI r7, 256
    LDI r14, 24
    RECTF r5, r13, r7, r14, r6

    LDI r5, 10
    LDI r13, TITLE_Y
    LDI r7, STR_BUF
    TEXT r5, r13, r7

    ; DEL button
    LDI r6, 0x884422
    LDI r5, 196
    LDI r13, 4
    LDI r7, 50
    LDI r14, 16
    RECTF r5, r13, r7, r14, r6
    LDI r5, 210
    LDI r13, TITLE_Y
    LDI r7, STR_BUF
    ADDI r7, 32
    TEXT r5, r13, r7

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
    LDI r9, 2
    MOD r22, r9
    CMPI r9, 0
    JZ r1, row_even
    LDI r6, 0x222244
    JMP row_bg
row_even:
    LDI r6, 0x1e1e3a
row_bg:
    LDI r5, ROW_X
    MOV r13, r24
    LDI r7, ROW_W
    LDI r14, ROW_H
    RECTF r5, r13, r7, r14, r6

    ; Filename
    LDI r5, ROW_X
    ADDI r5, 4
    MOV r13, r24
    ADDI r13, 4
    TEXT r5, r13, r20

    ; File size display (right-aligned in row)
    LDI r21, SIZE_TABLE
    ADD r21, r22
    LOAD r8, r21
    CMPI r8, 0xFFFFFFFF
    JZ r1, skip_size
    CMPI r8, 0
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
    LDI r5, SIZE_X
    MOV r13, r24
    ADDI r13, 4
    LDI r7, SIZE_STR_BUF
    TEXT r5, r13, r7
skip_size:

    ADDI r22, 1
    ADDI r23, 1
    LDI r9, ROW_H
    ADD r24, r9
    JMP draw_rows

rows_done:
    JMP do_hitq

; ═══════════════════════════════════════════════
; CONTENT VIEW (mode 1)
; ═══════════════════════════════════════════════
draw_content:
    LDI r13, 0x1a1a2e
    FILL r13

    LDI r6, 0x2a2a4a
    LDI r5, 0
    LDI r13, 0
    LDI r7, 256
    LDI r14, 24
    RECTF r5, r13, r7, r14, r6

    LDI r5, 10
    LDI r13, TITLE_Y
    LDI r7, STR_BUF
    ADDI r7, 16
    TEXT r5, r13, r7

    ; BACK button
    LDI r6, 0x555555
    LDI r5, 10
    LDI r13, BACK_Y
    LDI r7, 60
    LDI r14, 16
    RECTF r5, r13, r7, r14, r6
    LDI r5, 22
    LDI r13, BACK_Y
    ADDI r13, 4
    LDI r7, STR_BUF
    ADDI r7, 16
    TEXT r5, r13, r7

    ; Content
    LDI r5, 10
    LDI r13, 30
    LDI r7, CONTENT_BUF
    TEXT r5, r13, r7

    JMP do_hitq

; ═══════════════════════════════════════════════
; DELETE CONFIRM (mode 2)
; ═══════════════════════════════════════════════
draw_delete:
    LDI r13, 0x1a1a2e
    FILL r13

    ; Dialog box
    LDI r6, 0x2a2a4a
    LDI r5, 30
    LDI r13, 80
    LDI r7, 196
    LDI r14, 100
    RECTF r5, r13, r7, r14, r6

    ; Title
    LDI r5, 120
    LDI r13, 90
    LDI r7, STR_BUF
    ADDI r7, 32
    TEXT r5, r13, r7

    ; Filename
    LDI r20, DEL_TARGET
    LOAD r22, r20
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, del_no_name
    LDI r5, 40
    LDI r13, 120
    TEXT r5, r13, r20
del_no_name:

    ; [Y] green button
    LDI r6, 0x225522
    LDI r5, 50
    LDI r13, 150
    LDI r7, 70
    LDI r14, 20
    RECTF r5, r13, r7, r14, r6

    ; [N] red button
    LDI r6, 0x552222
    LDI r5, 140
    LDI r13, 150
    LDI r7, 70
    LDI r14, 20
    RECTF r5, r13, r7, r14, r6

    JMP do_hitq

; ═══════════════════════════════════════════════
; INPUT HANDLING
; ═══════════════════════════════════════════════
do_hitq:
    FRAME
    IKEY r2
    CMPI r2, 0
    JZ r1, chk_mouse

    LDI r20, MODE
    LOAD r9, r20

    ; Delete confirm keyboard (mode 2)
    CMPI r9, 2
    JNZ r1, kb_list
    CMPI r2, 89
    JZ r1, do_unlink
    CMPI r2, 121
    JZ r1, do_unlink
    CMPI r2, 78
    JZ r1, do_cancel
    CMPI r2, 110
    JZ r1, do_cancel
    CMPI r2, 27
    JZ r1, do_cancel
    JMP main_loop

kb_list:
    ; List mode D key
    CMPI r9, 0
    JNZ r1, chk_mouse
    CMPI r2, 68
    JZ r1, chk_mouse
    CMPI r2, 100
    JNZ r1, chk_mouse
    LDI r20, DEL_TARGET
    LDI r13, 255
    STORE r20, r13
    JMP main_loop

chk_mouse:
    LDI r12, 0
    HITQ r12
    CMPI r12, 0
    JZ r1, main_loop

    LDI r20, MODE
    LOAD r9, r20
    CMPI r9, 0
    JZ r1, on_list_click
    CMPI r9, 1
    JZ r1, on_content_click
    JMP main_loop

; ── List click handler ──
on_list_click:
    CMPI r12, 99
    JZ r1, main_loop

    LDI r20, DEL_TARGET
    LOAD r9, r20
    CMPI r9, 255
    JNZ r1, on_open

    ; Delete select: validate row
    CMPI r12, 1
    BLT r1, main_loop
    CMPI r12, 6
    BGE r1, main_loop
    SUBI r12, 1
    LDI r23, FNAME_TABLE
    ADD r23, r12
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, main_loop

    ; Enter delete confirm
    MOV r9, r12
    LDI r20, DEL_TARGET
    STORE r20, r9
    LDI r20, MODE
    LDI r13, 2
    STORE r20, r13
    JMP main_loop

on_open:
    CMPI r12, 1
    BLT r1, main_loop
    CMPI r12, 6
    BGE r1, main_loop
    SUBI r12, 1
    LDI r23, FNAME_TABLE
    ADD r23, r12
    LOAD r20, r23
    CMPI r20, 0
    JZ r1, main_loop

    ; Open and read
    LDI r9, 0
    OPEN r20, r9
    MOV r19, r1
    CMPI r1, 0xFFFFFFFF
    JZ r1, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    LDI r9, CONTENT_BUF
    LDI r15, 2048
    READ r19, r9, r15

    LDI r20, CONTENT_BUF
    ADD r20, r1
    LDI r13, 0
    STORE r20, r13

    CLOSE r19

    LDI r20, MODE
    LDI r13, 1
    STORE r20, r13
    JMP main_loop

; ── Content click handler ──
on_content_click:
    CMPI r12, 99
    JNZ r1, main_loop
    LDI r20, MODE
    LDI r13, 0
    STORE r20, r13
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
    LDI r13, 0
    STORE r20, r13
    LDI r20, DEL_TARGET
    LDI r13, 0
    STORE r20, r13
    PUSH r31
    CALL refresh_list
    POP r31
    JMP main_loop

; ═══════════════════════════════════════════════
; REFRESH LIST SUBROUTINE
; Clobbers: r1, r13, r20, r21, r22, r23
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
    LOAD r13, r20
    CMPI r13, 0
    JZ r1, rl_done

    STORE r23, r20
    ADDI r23, 1

    ; Get file size via VSTAT
    VSTAT r20
    LDI r21, SIZE_TABLE
    ADD r21, r22
    STORE r21, r1

rl_skip:
    LOAD r13, r20
    CMPI r13, 0
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
; Converts r8 (u32) to decimal string at r20
; Clobbers: r8-r19, r20
; ═══════════════════════════════════════════════
int_to_str:
    PUSH r31
    LDI r16, 0
    JZ r8, its_zero

its_loop:
    MOV r18, r8
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r8, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r8, its_loop

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
