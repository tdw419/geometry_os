; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r14, 1

; Init selected PID
LDI r8, 0
LDI r20, SEL_PID
STORE r20, r8

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r14, C_BG
    FILL r14

    ; Title bar
    LDI r14, 0
    LDI r12, 0
    LDI r3, 256
    LDI r2, 20
    LDI r6, C_TITLE
    RECTF r14, r12, r3, r2, r6

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r14, 56
    LDI r12, 4
    LDI r3, BUF
    LDI r2, C_FG
    LDI r6, C_TITLE
    DRAWTEXT r14, r12, r3, r2, r6

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r14, 4
    LDI r12, 22
    LDI r3, BUF
    LDI r2, C_LABEL
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Separator line
    LDI r14, 4
    LDI r12, 32
    LDI r3, 248
    LDI r2, 1
    LDI r6, C_LABEL
    RECTF r14, r12, r3, r2, r6

    ; Get process count
    NPROC
    MOV r10, r1          ; r10 = total count

    ; Draw process rows (up to 10 visible)
    LDI r5, 0           ; current PID
row_loop:
    CMP r5, r10
    BGE r1, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r8, 18
    MOV r26, r5
    MUL r26, r8
    ADD r26, r8         ; r8 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r8, 36
    ADD r26, r8

    ; Check if off screen
    LDI r8, 230
    CMP r26, r8
    BGE r1, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r5, r25
    JNZ r1, not_sel

    ; Highlight row
    LDI r14, 4
    MOV r12, r26
    LDI r3, 248
    LDI r2, 16
    LDI r6, C_SEL
    RECTF r14, r12, r3, r2, r6
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r14, 4
    MOV r12, r26
    LDI r3, 248
    LDI r2, 16
    LDI r6, 0x141428
    RECTF r14, r12, r3, r2, r6

draw_pid:
    ; Draw PID number
    MOV r15, r5
    LDI r20, BUF
    CALL int_to_str
    LDI r14, 8
    LDI r8, 4
    MOV r12, r26
    ADD r12, r8
    LDI r3, BUF
    LDI r2, C_CYAN
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Get state (field 0)
    MOV r14, r5
    LDI r12, 0
    PROCINFO r14, r12
    MOV r15, r1

    ; Draw state name
    LDI r20, BUF
    LDI r8, 0
    CMP r15, r8
    JNZ r1, chk_s1
    STRO r20, "Ready"
    LDI r8, C_GREEN
    JMP draw_st
chk_s1:
    LDI r8, 1
    CMP r15, r8
    JNZ r1, chk_s2
    STRO r20, "Run"
    LDI r8, C_GREEN
    JMP draw_st
chk_s2:
    LDI r8, 2
    CMP r15, r8
    JNZ r1, chk_s3
    STRO r20, "Sleep"
    LDI r8, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r8, 3
    CMP r15, r8
    JNZ r1, chk_s4
    STRO r20, "Block"
    LDI r8, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r8, 4
    CMP r15, r8
    JNZ r1, chk_s5
    STRO r20, "Zombie"
    LDI r8, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r8, C_GRAY

draw_st:
    LDI r14, 38
    LDI r16, 4
    MOV r12, r26
    ADD r12, r16
    LDI r3, BUF
    MOV r2, r8
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Get PC (field 1)
    MOV r14, r5
    LDI r12, 1
    PROCINFO r14, r12
    MOV r15, r1

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r14, 88
    LDI r16, 4
    MOV r12, r26
    ADD r12, r16
    LDI r3, BUF
    LDI r2, C_FG
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Get priority (field 2)
    MOV r14, r5
    LDI r12, 2
    PROCINFO r14, r12
    MOV r15, r1
    LDI r20, BUF
    CALL int_to_str
    LDI r14, 150
    LDI r16, 4
    MOV r12, r26
    ADD r12, r16
    LDI r3, BUF
    LDI r2, C_FG
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Get pages (field 4)
    MOV r14, r5
    LDI r12, 4
    PROCINFO r14, r12
    MOV r15, r1
    LDI r20, BUF
    CALL int_to_str
    LDI r14, 180
    LDI r16, 4
    MOV r12, r26
    ADD r12, r16
    LDI r3, BUF
    LDI r2, C_FG
    LDI r6, 0
    DRAWTEXT r14, r12, r3, r2, r6

    ; Next PID
    LDI r8, 1
    ADD r5, r8
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r14, 0
    LDI r12, 236
    LDI r3, 256
    LDI r2, 20
    LDI r6, C_TITLE
    RECTF r14, r12, r3, r2, r6

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r14, 16
    LDI r12, 242
    LDI r3, BUF
    LDI r2, C_GRAY
    LDI r6, C_TITLE
    DRAWTEXT r14, r12, r3, r2, r6

    ; Process count
    MOV r15, r10
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r14, 200
    LDI r12, 242
    LDI r3, BUF
    LDI r2, C_GRAY
    LDI r6, C_TITLE
    DRAWTEXT r14, r12, r3, r2, r6

    MOV r15, r10
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r14, 235
    LDI r12, 242
    LDI r3, NUMBUF
    LDI r2, C_CYAN
    LDI r6, C_TITLE
    DRAWTEXT r14, r12, r3, r2, r6

    ; Handle input
    IKEY r8
    JZ r8, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r8, r16
    JNZ r1, chk_s_down
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
    CMP r8, r16
    JNZ r1, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r10
    BGE r1, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r8, r16
    JNZ r1, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r14, r16
    KILL r14
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r8, r16
    JNZ r1, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r15 (u32) to decimal string at r20
; Returns null-terminated. r1 = buffer start.
; Clobbers r15-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r15, its_zero

its_loop:
    MOV r18, r15
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r15, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r15, its_loop

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
    POP r1
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r1
    POP r31
    RET
