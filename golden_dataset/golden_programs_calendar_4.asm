; DESCRIPTION: A colored object centered at the screen with fixed size.

; calendar.asm -- Monthly Calendar for Geometry OS
;
; Shows a month grid with day numbers. Arrow keys navigate months.
; Uses Zeller congruence for day-of-week calculation.
;
; Proves: DIV, MOD, MUL, SUB, ADD, CMP, BLT, BGE, TEXT, DRAWTEXT,
;         RECTF, STRO, IKEY, FRAME, integer math algorithms.
;
; RAM Layout:
;   0x6000-0x60FF  Text buffers
;   0x6100         Month (1-12)
;   0x6101         Year
;   0x6102         Days in month
;   0x6103         First day of month (0=Sun, 6=Sat)
;   0x6104         Frame counter for blink
;
; Zeller Congruence (adapted for 0=Sunday):
;   h = (q + (13*(m+1))/5 + K + K/4 + J/4 + 5*J) % 7
;   where q=day, m=month (3=Mar..14=Feb), K=year%100, J=year/100
;   Result: 0=Saturday, 1=Sunday, ... 6=Friday
;   Shift by +1 for Sunday=0: (h+1)%7
;
; No colons in comments (assembler pitfall)

#define TICKS   0xFFE
#define BUF     0x6000
#define MONTH   0x6100
#define YEAR    0x6101
#define MDAYS   0x6102
#define FDAY    0x6103
#define BLINK   0x6104

; Init
LDI r30, 0xFD00
LDI r3, 1

; Default month/year (April 2026)
LDI r20, MONTH
LDI r21, 4
STORE r20, r21
LDI r20, YEAR
LDI r21, 2026
STORE r20, r21
LDI r20, BLINK
LDI r21, 0
STORE r20, r21

; Compute initial month data
CALL compute_month

; =========================================
; Main Loop
; =========================================
main_loop:
    ; Read keyboard
    IKEY r8
    JZ r8, no_input

    ; Left arrow (D=68) = previous month
    LDI r13, 68
    CMP r8, r13
    JZ r10, prev_month

    ; Right arrow (C=67) = next month
    LDI r13, 67
    CMP r8, r13
    JZ r10, next_month

    ; Up arrow (A=65) = previous year
    LDI r13, 65
    CMP r8, r13
    JZ r10, prev_year

    ; Down arrow (B=66) = next year
    LDI r13, 66
    CMP r8, r13
    JZ r10, next_year

    ; ESC = quit
    LDI r13, 27
    CMP r8, r13
    JZ r10, cal_quit

    JMP no_input

prev_month:
    LDI r20, MONTH
    LOAD r4, r20
    LDI r13, 1
    SUB r4, r13
    JNZ r4, pm_store
    LDI r4, 12
    LDI r20, YEAR
    LOAD r16, r20
    LDI r13, 1
    SUB r16, r13
    STORE r20, r16
    LDI r20, MONTH
pm_store:
    STORE r20, r4
    CALL compute_month
    JMP no_input

next_month:
    LDI r20, MONTH
    LOAD r4, r20
    LDI r13, 1
    ADD r4, r13
    LDI r13, 13
    CMP r4, r13
    JZ r10, nm_wrap
    STORE r20, r4
    CALL compute_month
    JMP no_input

nm_wrap:
    LDI r4, 1
    STORE r20, r4
    LDI r20, YEAR
    LOAD r4, r20
    LDI r13, 1
    ADD r4, r13
    STORE r20, r4
    CALL compute_month
    JMP no_input

prev_year:
    LDI r20, YEAR
    LOAD r4, r20
    LDI r13, 1
    SUB r4, r13
    STORE r20, r4
    CALL compute_month
    JMP no_input

next_year:
    LDI r20, YEAR
    LOAD r4, r20
    LDI r13, 1
    ADD r4, r13
    STORE r20, r4
    CALL compute_month
    JMP no_input

no_input:
    ; Update blink
    LDI r20, TICKS
    LOAD r4, r20
    LDI r13, 30
    DIV r4, r13
    LDI r20, BLINK
    STORE r20, r4

    ; Render
    CALL render_calendar

    FRAME
    JMP main_loop

cal_quit:
    HALT

; =========================================
; compute_month -- calculate days in month and first day
; Uses: r8-r19
; =========================================
compute_month:
    PUSH r31

    LDI r20, MONTH
    LOAD r8, r20       ; r8 = month (1-12)
    LDI r20, YEAR
    LOAD r13, r20       ; r13 = year

    ; Compute days in month
    LDI r7, 2
    CMP r8, r7
    JZ r10, feb_days

    ; Non-Feb: 30 days for Apr,Jun,Sep,Nov; 31 for rest
    LDI r7, 31
    LDI r14, 4
    CMP r8, r14
    JZ r10, set_30
    LDI r14, 6
    CMP r8, r14
    JZ r10, set_30
    LDI r14, 9
    CMP r8, r14
    JZ r10, set_30
    LDI r14, 11
    CMP r8, r14
    JZ r10, set_30
    JMP store_mdays

set_30:
    LDI r7, 30
    JMP store_mdays

feb_days:
    LDI r7, 28
    MOV r14, r13
    LDI r15, 4
    MOD r14, r15
    JNZ r14, store_mdays
    MOV r14, r13
    LDI r15, 100
    MOD r14, r15
    JNZ r14, is_leap
    MOV r14, r13
    LDI r15, 400
    MOD r14, r15
    JNZ r14, store_mdays

is_leap:
    LDI r7, 29

store_mdays:
    LDI r20, MDAYS
    STORE r20, r7

    ; Zeller congruence for first day
    MOV r14, r8
    MOV r15, r13

    ; Jan->13, Feb->14, year--
    LDI r4, 3
    CMP r14, r4
    BGE r10, zeller_ok
    LDI r4, 12
    ADD r14, r4
    LDI r4, 1
    SUB r15, r4

zeller_ok:
    ; K = year % 100
    MOV r4, r15
    LDI r16, 100
    MOD r4, r16

    ; J = year / 100
    MOV r16, r15
    LDI r17, 100
    DIV r16, r17

    ; (13*(m+1))/5
    LDI r17, 1
    ADD r14, r17
    LDI r17, 13
    MUL r14, r17
    LDI r17, 5
    DIV r14, r17

    ; h = 1 + 13*(m+1)/5 + K + K/4 + J/4 + 5*J
    LDI r17, 1
    ADD r17, r14
    ADD r17, r4
    MOV r18, r4
    LDI r19, 4
    DIV r18, r19
    ADD r17, r18
    MOV r18, r16
    LDI r19, 4
    DIV r18, r19
    ADD r17, r18
    LDI r18, 5
    MUL r18, r16
    ADD r17, r18

    ; h = h % 7
    LDI r18, 7
    MOD r17, r18

    ; Convert to 0=Sunday: (h + 6) % 7
    ; Zeller: 0=Sat,1=Sun,2=Mon,3=Tue,4=Wed,5=Thu,6=Fri
    ; Target: 0=Sun,1=Mon,2=Tue,3=Wed,4=Thu,5=Fri,6=Sat
    LDI r18, 6
    ADD r17, r18
    LDI r18, 7
    MOD r17, r18

    LDI r20, FDAY
    STORE r20, r17

    POP r31
    RET

; =========================================
; render_calendar -- draw the calendar screen
; Uses: r3-r6
; =========================================
render_calendar:
    PUSH r31

    ; Background
    LDI r3, 0x0D1B2A
    FILL r3

    ; Title bar
    LDI r3, 0
    LDI r2, 0
    LDI r11, 256
    LDI r9, 28
    LDI r0, 0x1B3A5C
    RECTF r3, r2, r11, r9, r0

    ; Month name in title
    LDI r20, MONTH
    LOAD r8, r20
    LDI r20, BUF
    CALL get_month_name
    LDI r3, 8
    LDI r2, 8
    LDI r11, BUF
    LDI r9, 0xFFFFFF
    LDI r0, 0x1B3A5C
    DRAWTEXT r3, r2, r11, r9, r0

    ; Year in title
    LDI r20, YEAR
    LOAD r4, r20
    LDI r20, BUF
    CALL int_to_str
    LDI r3, 80
    LDI r2, 8
    LDI r11, BUF
    LDI r9, 0xFFFFFF
    LDI r0, 0x1B3A5C
    DRAWTEXT r3, r2, r11, r9, r0

    ; =========================================
    ; Day-of-week header row
    ; =========================================
    LDI r0, 0x1A1A3A
    LDI r3, 16
    LDI r2, 32
    LDI r11, 224
    LDI r9, 16
    RECTF r3, r2, r11, r9, r0

    ; S M T W T F S headers
    LDI r3, 22
    LDI r2, 34
    LDI r20, BUF
    STRO r20, "S"
    LDI r11, BUF
    LDI r9, 0x8888BB
    LDI r0, 0x1A1A3A
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 54
    LDI r20, BUF
    STRO r20, "M"
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 86
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 118
    LDI r20, BUF
    STRO r20, "W"
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 150
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 182
    LDI r20, BUF
    STRO r20, "F"
    DRAWTEXT r3, r2, r11, r9, r0

    LDI r3, 214
    LDI r20, BUF
    STRO r20, "S"
    DRAWTEXT r3, r2, r11, r9, r0

    ; =========================================
    ; Draw day grid
    ; =========================================
    LDI r20, FDAY
    LOAD r12, r20          ; r12 = first day (0=Sun..6=Sat)
    LDI r20, MDAYS
    LOAD r6, r20          ; r6 = days in month
    LDI r8, 1            ; r8 = current day (1..31)

    ; Grid layout: 7 columns, each 32px wide, starting at x=16
    ; Row starts at y=50, each row 24px
    LDI r13, 0            ; column counter (0-6)
    MOV r7, r12           ; start column = first day
    LDI r14, 50           ; y position

day_loop:
    ; Check if done
    MOV r15, r6
    LDI r4, 1
    ADD r15, r4
    CMP r8, r15
    BGE r10, days_done

    ; Compute x position: 16 + column * 32 + 4
    MOV r4, r7
    LDI r16, 32
    MUL r4, r16
    LDI r16, 20
    ADD r4, r16          ; r4 = x

    ; Draw day cell background
    LDI r3, 0x16162E
    MOV r2, r14
    LDI r11, 28
    LDI r9, 22
    RECTF r4, r2, r11, r9, r3

    ; Save x position before int_to_str trashes registers
    MOV r5, r7           ; save column
    MOV r1, r14           ; save y

    ; Convert day number to string
    LDI r20, BUF
    MOV r4, r8
    CALL int_to_str

    ; Recompute x for text (centered in cell)
    MOV r4, r5
    LDI r16, 32
    MUL r4, r16
    LDI r16, 26
    ADD r4, r16          ; x for text
    MOV r2, r1            ; restore y
    LDI r16, 4
    ADD r2, r16           ; y offset for text
    LDI r11, BUF
    LDI r9, 0xCCCCFF
    LDI r0, 0x16162E
    DRAWTEXT r4, r2, r11, r9, r0

    ; Advance column
    LDI r16, 1
    ADD r7, r16
    LDI r16, 7
    CMP r7, r16
    BLT r10, same_row

    ; New row
    LDI r7, 0
    LDI r16, 24
    ADD r14, r16

same_row:
    ; Next day
    LDI r16, 1
    ADD r8, r16
    JMP day_loop

days_done:
    ; =========================================
    ; Footer
    ; =========================================
    LDI r3, 0
    LDI r2, 236
    LDI r11, 256
    LDI r9, 20
    LDI r0, 0x0A0A1A
    RECTF r3, r2, r11, r9, r0

    LDI r20, BUF
    STRO r20, "Arrows: navigate  ESC: quit"
    LDI r3, 40
    LDI r2, 240
    LDI r11, BUF
    LDI r9, 0x6666AA
    LDI r0, 0x0A0A1A
    DRAWTEXT r3, r2, r11, r9, r0

    POP r31
    RET

; =========================================
; get_month_name -- write month name to BUF
; Input: r8 = month (1-12), r20 = buffer addr
; =========================================
get_month_name:
    PUSH r31

    LDI r13, 1
    CMP r8, r13
    JZ r10, gm_jan

    LDI r13, 2
    CMP r8, r13
    JZ r10, gm_feb

    LDI r13, 3
    CMP r8, r13
    JZ r10, gm_mar

    LDI r13, 4
    CMP r8, r13
    JZ r10, gm_apr

    LDI r13, 5
    CMP r8, r13
    JZ r10, gm_may

    LDI r13, 6
    CMP r8, r13
    JZ r10, gm_jun

    LDI r13, 7
    CMP r8, r13
    JZ r10, gm_jul

    LDI r13, 8
    CMP r8, r13
    JZ r10, gm_aug

    LDI r13, 9
    CMP r8, r13
    JZ r10, gm_sep

    LDI r13, 10
    CMP r8, r13
    JZ r10, gm_oct

    LDI r13, 11
    CMP r8, r13
    JZ r10, gm_nov

    ; Default: December
    STRO r20, "December"
    POP r31
    RET

gm_jan:
    STRO r20, "January"
    POP r31
    RET

gm_feb:
    STRO r20, "February"
    POP r31
    RET

gm_mar:
    STRO r20, "March"
    POP r31
    RET

gm_apr:
    STRO r20, "April"
    POP r31
    RET

gm_may:
    STRO r20, "May"
    POP r31
    RET

gm_jun:
    STRO r20, "June"
    POP r31
    RET

gm_jul:
    STRO r20, "July"
    POP r31
    RET

gm_aug:
    STRO r20, "August"
    POP r31
    RET

gm_sep:
    STRO r20, "September"
    POP r31
    RET

gm_oct:
    STRO r20, "October"
    POP r31
    RET

gm_nov:
    STRO r20, "November"
    POP r31
    RET

; =========================================
; int_to_str subroutine
; Converts r4 (u32) to decimal string at r20
; Destroys r4-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0

    JZ r4, its_zero

its_loop:
    MOV r18, r4
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r4, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r4, its_loop

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
