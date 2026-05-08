; DESCRIPTION: The GeOS assembly code in `procmon.asm` serves as a process monitor for the Geometry OS, displaying all running processes with their PID, state, program counter (PC), priority, and memory pages. It provides interactive functionality to scroll through processes using the W/S keys, kill a selected process with K, or quit the application with Q. The code updates every frame by calling NPROC and PROCINFO opcodes to fetch process information and renders it on screen.

; procmon.asm -- Process Monitor for Geometry OS (Phase 140)
;
; Shows: all GeOS processes with PID, State, PC, Priority, Pages
; Interactive: W/S scrolls, K kills selected process, Q quits
; Updates every frame via NPROC + PROCINFO opcodes.
;
; RAM Layout:
;   0x6000-0x60FF  String buffers
;   0x6100-0x61FF  Number conversion buffer
;   0x6200         Selected PID (u32)
;
; Uses: NPROC, PROCINFO, DRAWTEXT, RECTF, FILL, FRAME, IKEY, KILL, STRO

#define TICKS   0xFFE
#define BUF     0x6000
#define NUMBUF  0x6100
#define SEL_PID 0x6200

; Colors
#define C_BG    0x0D1B2A
#define C_TITLE 0x1B3A5C
#define C_PANEL 0x1B2838
#define C_FG    0xFFFFFF
#define C_LABEL 0x8888CC
#define C_GREEN 0x44FF44
#define C_YELLOW 0xFFFF44
#define C_RED    0xFF4444
#define C_CYAN   0x44FFFF
#define C_GRAY   0x666688
#define C_SEL    0x334466

; Init
LDI r30, 0xFD00
LDI r15, 1

; Init selected PID
LDI r4, 0
LDI r20, SEL_PID
STORE r20, r4

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r15, C_BG
    FILL r15

    ; Title bar
    LDI r15, 0
    LDI r13, 0
    LDI r2, 256
    LDI r12, 20
    LDI r5, C_TITLE
    RECTF r15, r13, r2, r12, r5

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r15, 56
    LDI r13, 4
    LDI r2, BUF
    LDI r12, C_FG
    LDI r5, C_TITLE
    DRAWTEXT r15, r13, r2, r12, r5

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r15, 4
    LDI r13, 22
    LDI r2, BUF
    LDI r12, C_LABEL
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Separator line
    LDI r15, 4
    LDI r13, 32
    LDI r2, 248
    LDI r12, 1
    LDI r5, C_LABEL
    RECTF r15, r13, r2, r12, r5

    ; Get process count
    NPROC
    MOV r14, r10          ; r14 = total count

    ; Draw process rows (up to 10 visible)
    LDI r9, 0           ; current PID
row_loop:
    CMP r9, r14
    BGE r10, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r4, 18
    MOV r26, r9
    MUL r26, r4
    ADD r26, r4         ; r4 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r4, 36
    ADD r26, r4

    ; Check if off screen
    LDI r4, 230
    CMP r26, r4
    BGE r10, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r9, r25
    JNZ r10, not_sel

    ; Highlight row
    LDI r15, 4
    MOV r13, r26
    LDI r2, 248
    LDI r12, 16
    LDI r5, C_SEL
    RECTF r15, r13, r2, r12, r5
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r15, 4
    MOV r13, r26
    LDI r2, 248
    LDI r12, 16
    LDI r5, 0x141428
    RECTF r15, r13, r2, r12, r5

draw_pid:
    ; Draw PID number
    MOV r0, r9
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 8
    LDI r4, 4
    MOV r13, r26
    ADD r13, r4
    LDI r2, BUF
    LDI r12, C_CYAN
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Get state (field 0)
    MOV r15, r9
    LDI r13, 0
    PROCINFO r15, r13
    MOV r0, r10

    ; Draw state name
    LDI r20, BUF
    LDI r4, 0
    CMP r0, r4
    JNZ r10, chk_s1
    STRO r20, "Ready"
    LDI r4, C_GREEN
    JMP draw_st
chk_s1:
    LDI r4, 1
    CMP r0, r4
    JNZ r10, chk_s2
    STRO r20, "Run"
    LDI r4, C_GREEN
    JMP draw_st
chk_s2:
    LDI r4, 2
    CMP r0, r4
    JNZ r10, chk_s3
    STRO r20, "Sleep"
    LDI r4, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r4, 3
    CMP r0, r4
    JNZ r10, chk_s4
    STRO r20, "Block"
    LDI r4, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r4, 4
    CMP r0, r4
    JNZ r10, chk_s5
    STRO r20, "Zombie"
    LDI r4, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r4, C_GRAY

draw_st:
    LDI r15, 38
    LDI r16, 4
    MOV r13, r26
    ADD r13, r16
    LDI r2, BUF
    MOV r12, r4
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Get PC (field 1)
    MOV r15, r9
    LDI r13, 1
    PROCINFO r15, r13
    MOV r0, r10

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 88
    LDI r16, 4
    MOV r13, r26
    ADD r13, r16
    LDI r2, BUF
    LDI r12, C_FG
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Get priority (field 2)
    MOV r15, r9
    LDI r13, 2
    PROCINFO r15, r13
    MOV r0, r10
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 150
    LDI r16, 4
    MOV r13, r26
    ADD r13, r16
    LDI r2, BUF
    LDI r12, C_FG
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Get pages (field 4)
    MOV r15, r9
    LDI r13, 4
    PROCINFO r15, r13
    MOV r0, r10
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 180
    LDI r16, 4
    MOV r13, r26
    ADD r13, r16
    LDI r2, BUF
    LDI r12, C_FG
    LDI r5, 0
    DRAWTEXT r15, r13, r2, r12, r5

    ; Next PID
    LDI r4, 1
    ADD r9, r4
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r15, 0
    LDI r13, 236
    LDI r2, 256
    LDI r12, 20
    LDI r5, C_TITLE
    RECTF r15, r13, r2, r12, r5

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r15, 16
    LDI r13, 242
    LDI r2, BUF
    LDI r12, C_GRAY
    LDI r5, C_TITLE
    DRAWTEXT r15, r13, r2, r12, r5

    ; Process count
    MOV r0, r14
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r15, 200
    LDI r13, 242
    LDI r2, BUF
    LDI r12, C_GRAY
    LDI r5, C_TITLE
    DRAWTEXT r15, r13, r2, r12, r5

    MOV r0, r14
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r15, 235
    LDI r13, 242
    LDI r2, NUMBUF
    LDI r12, C_CYAN
    LDI r5, C_TITLE
    DRAWTEXT r15, r13, r2, r12, r5

    ; Handle input
    IKEY r4
    JZ r4, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r4, r16
    JNZ r10, chk_s_down
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    LDI r17, 1
    SUB r16, r17
    STORE r20, r16
    JMP no_input

chk_s_down:
    ; S = 83 (scroll down / next)
    LDI r16, 83
    CMP r4, r16
    JNZ r10, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r14
    BGE r10, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r4, r16
    JNZ r10, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r15, r16
    KILL r15
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r4, r16
    JNZ r10, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r0 (u32) to decimal string at r20
; Returns null-terminated. r10 = buffer start.
; Clobbers r0-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r0, its_zero

its_loop:
    MOV r18, r0
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r0, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r0, its_loop

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
    POP r10
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r10
    POP r31
    RET
