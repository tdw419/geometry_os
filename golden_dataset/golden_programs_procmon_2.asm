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
LDI r3, 1

; Init selected PID
LDI r2, 0
LDI r20, SEL_PID
STORE r20, r2

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r3, C_BG
    FILL r3

    ; Title bar
    LDI r3, 0
    LDI r5, 0
    LDI r15, 256
    LDI r9, 20
    LDI r14, C_TITLE
    RECTF r3, r5, r15, r9, r14

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r3, 56
    LDI r5, 4
    LDI r15, BUF
    LDI r9, C_FG
    LDI r14, C_TITLE
    DRAWTEXT r3, r5, r15, r9, r14

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r3, 4
    LDI r5, 22
    LDI r15, BUF
    LDI r9, C_LABEL
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Separator line
    LDI r3, 4
    LDI r5, 32
    LDI r15, 248
    LDI r9, 1
    LDI r14, C_LABEL
    RECTF r3, r5, r15, r9, r14

    ; Get process count
    NPROC
    MOV r6, r12          ; r6 = total count

    ; Draw process rows (up to 10 visible)
    LDI r11, 0           ; current PID
row_loop:
    CMP r11, r6
    BGE r12, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r2, 18
    MOV r26, r11
    MUL r26, r2
    ADD r26, r2         ; r2 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r2, 36
    ADD r26, r2

    ; Check if off screen
    LDI r2, 230
    CMP r26, r2
    BGE r12, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r11, r25
    JNZ r12, not_sel

    ; Highlight row
    LDI r3, 4
    MOV r5, r26
    LDI r15, 248
    LDI r9, 16
    LDI r14, C_SEL
    RECTF r3, r5, r15, r9, r14
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r3, 4
    MOV r5, r26
    LDI r15, 248
    LDI r9, 16
    LDI r14, 0x141428
    RECTF r3, r5, r15, r9, r14

draw_pid:
    ; Draw PID number
    MOV r10, r11
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 8
    LDI r2, 4
    MOV r5, r26
    ADD r5, r2
    LDI r15, BUF
    LDI r9, C_CYAN
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Get state (field 0)
    MOV r3, r11
    LDI r5, 0
    PROCINFO r3, r5
    MOV r10, r12

    ; Draw state name
    LDI r20, BUF
    LDI r2, 0
    CMP r10, r2
    JNZ r12, chk_s1
    STRO r20, "Ready"
    LDI r2, C_GREEN
    JMP draw_st
chk_s1:
    LDI r2, 1
    CMP r10, r2
    JNZ r12, chk_s2
    STRO r20, "Run"
    LDI r2, C_GREEN
    JMP draw_st
chk_s2:
    LDI r2, 2
    CMP r10, r2
    JNZ r12, chk_s3
    STRO r20, "Sleep"
    LDI r2, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r2, 3
    CMP r10, r2
    JNZ r12, chk_s4
    STRO r20, "Block"
    LDI r2, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r2, 4
    CMP r10, r2
    JNZ r12, chk_s5
    STRO r20, "Zombie"
    LDI r2, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r2, C_GRAY

draw_st:
    LDI r3, 38
    LDI r16, 4
    MOV r5, r26
    ADD r5, r16
    LDI r15, BUF
    MOV r9, r2
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Get PC (field 1)
    MOV r3, r11
    LDI r5, 1
    PROCINFO r3, r5
    MOV r10, r12

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 88
    LDI r16, 4
    MOV r5, r26
    ADD r5, r16
    LDI r15, BUF
    LDI r9, C_FG
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Get priority (field 2)
    MOV r3, r11
    LDI r5, 2
    PROCINFO r3, r5
    MOV r10, r12
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 150
    LDI r16, 4
    MOV r5, r26
    ADD r5, r16
    LDI r15, BUF
    LDI r9, C_FG
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Get pages (field 4)
    MOV r3, r11
    LDI r5, 4
    PROCINFO r3, r5
    MOV r10, r12
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 180
    LDI r16, 4
    MOV r5, r26
    ADD r5, r16
    LDI r15, BUF
    LDI r9, C_FG
    LDI r14, 0
    DRAWTEXT r3, r5, r15, r9, r14

    ; Next PID
    LDI r2, 1
    ADD r11, r2
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r3, 0
    LDI r5, 236
    LDI r15, 256
    LDI r9, 20
    LDI r14, C_TITLE
    RECTF r3, r5, r15, r9, r14

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r3, 16
    LDI r5, 242
    LDI r15, BUF
    LDI r9, C_GRAY
    LDI r14, C_TITLE
    DRAWTEXT r3, r5, r15, r9, r14

    ; Process count
    MOV r10, r6
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r3, 200
    LDI r5, 242
    LDI r15, BUF
    LDI r9, C_GRAY
    LDI r14, C_TITLE
    DRAWTEXT r3, r5, r15, r9, r14

    MOV r10, r6
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r3, 235
    LDI r5, 242
    LDI r15, NUMBUF
    LDI r9, C_CYAN
    LDI r14, C_TITLE
    DRAWTEXT r3, r5, r15, r9, r14

    ; Handle input
    IKEY r2
    JZ r2, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r2, r16
    JNZ r12, chk_s_down
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
    CMP r2, r16
    JNZ r12, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r6
    BGE r12, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r2, r16
    JNZ r12, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r3, r16
    KILL r3
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r2, r16
    JNZ r12, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r10 (u32) to decimal string at r20
; Returns null-terminated. r12 = buffer start.
; Clobbers r10-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
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
    POP r12
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r12
    POP r31
    RET
