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
LDI r7, 0
LDI r20, SEL_PID
STORE r20, r7

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r3, C_BG
    FILL r3

    ; Title bar
    LDI r3, 0
    LDI r6, 0
    LDI r12, 256
    LDI r11, 20
    LDI r10, C_TITLE
    RECTF r3, r6, r12, r11, r10

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r3, 56
    LDI r6, 4
    LDI r12, BUF
    LDI r11, C_FG
    LDI r10, C_TITLE
    DRAWTEXT r3, r6, r12, r11, r10

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r3, 4
    LDI r6, 22
    LDI r12, BUF
    LDI r11, C_LABEL
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Separator line
    LDI r3, 4
    LDI r6, 32
    LDI r12, 248
    LDI r11, 1
    LDI r10, C_LABEL
    RECTF r3, r6, r12, r11, r10

    ; Get process count
    NPROC
    MOV r0, r15          ; r0 = total count

    ; Draw process rows (up to 10 visible)
    LDI r1, 0           ; current PID
row_loop:
    CMP r1, r0
    BGE r15, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r7, 18
    MOV r26, r1
    MUL r26, r7
    ADD r26, r7         ; r7 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r7, 36
    ADD r26, r7

    ; Check if off screen
    LDI r7, 230
    CMP r26, r7
    BGE r15, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r1, r25
    JNZ r15, not_sel

    ; Highlight row
    LDI r3, 4
    MOV r6, r26
    LDI r12, 248
    LDI r11, 16
    LDI r10, C_SEL
    RECTF r3, r6, r12, r11, r10
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r3, 4
    MOV r6, r26
    LDI r12, 248
    LDI r11, 16
    LDI r10, 0x141428
    RECTF r3, r6, r12, r11, r10

draw_pid:
    ; Draw PID number
    MOV r14, r1
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 8
    LDI r7, 4
    MOV r6, r26
    ADD r6, r7
    LDI r12, BUF
    LDI r11, C_CYAN
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Get state (field 0)
    MOV r3, r1
    LDI r6, 0
    PROCINFO r3, r6
    MOV r14, r15

    ; Draw state name
    LDI r20, BUF
    LDI r7, 0
    CMP r14, r7
    JNZ r15, chk_s1
    STRO r20, "Ready"
    LDI r7, C_GREEN
    JMP draw_st
chk_s1:
    LDI r7, 1
    CMP r14, r7
    JNZ r15, chk_s2
    STRO r20, "Run"
    LDI r7, C_GREEN
    JMP draw_st
chk_s2:
    LDI r7, 2
    CMP r14, r7
    JNZ r15, chk_s3
    STRO r20, "Sleep"
    LDI r7, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r7, 3
    CMP r14, r7
    JNZ r15, chk_s4
    STRO r20, "Block"
    LDI r7, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r7, 4
    CMP r14, r7
    JNZ r15, chk_s5
    STRO r20, "Zombie"
    LDI r7, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r7, C_GRAY

draw_st:
    LDI r3, 38
    LDI r16, 4
    MOV r6, r26
    ADD r6, r16
    LDI r12, BUF
    MOV r11, r7
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Get PC (field 1)
    MOV r3, r1
    LDI r6, 1
    PROCINFO r3, r6
    MOV r14, r15

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 88
    LDI r16, 4
    MOV r6, r26
    ADD r6, r16
    LDI r12, BUF
    LDI r11, C_FG
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Get priority (field 2)
    MOV r3, r1
    LDI r6, 2
    PROCINFO r3, r6
    MOV r14, r15
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 150
    LDI r16, 4
    MOV r6, r26
    ADD r6, r16
    LDI r12, BUF
    LDI r11, C_FG
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Get pages (field 4)
    MOV r3, r1
    LDI r6, 4
    PROCINFO r3, r6
    MOV r14, r15
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 180
    LDI r16, 4
    MOV r6, r26
    ADD r6, r16
    LDI r12, BUF
    LDI r11, C_FG
    LDI r10, 0
    DRAWTEXT r3, r6, r12, r11, r10

    ; Next PID
    LDI r7, 1
    ADD r1, r7
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r3, 0
    LDI r6, 236
    LDI r12, 256
    LDI r11, 20
    LDI r10, C_TITLE
    RECTF r3, r6, r12, r11, r10

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r3, 16
    LDI r6, 242
    LDI r12, BUF
    LDI r11, C_GRAY
    LDI r10, C_TITLE
    DRAWTEXT r3, r6, r12, r11, r10

    ; Process count
    MOV r14, r0
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r3, 200
    LDI r6, 242
    LDI r12, BUF
    LDI r11, C_GRAY
    LDI r10, C_TITLE
    DRAWTEXT r3, r6, r12, r11, r10

    MOV r14, r0
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r3, 235
    LDI r6, 242
    LDI r12, NUMBUF
    LDI r11, C_CYAN
    LDI r10, C_TITLE
    DRAWTEXT r3, r6, r12, r11, r10

    ; Handle input
    IKEY r7
    JZ r7, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r7, r16
    JNZ r15, chk_s_down
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
    CMP r7, r16
    JNZ r15, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r0
    BGE r15, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r7, r16
    JNZ r15, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r3, r16
    KILL r3
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r7, r16
    JNZ r15, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r14 (u32) to decimal string at r20
; Returns null-terminated. r15 = buffer start.
; Clobbers r14-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r14, its_zero

its_loop:
    MOV r18, r14
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r14, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r14, its_loop

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
    POP r15
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r15
    POP r31
    RET
