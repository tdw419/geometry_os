; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
LDI r15, 1

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
    IKEY r3
    JZ r3, no_input

    ; Left arrow (D=68) = previous month
    LDI r1, 68
    CMP r3, r1
    JZ r11, prev_month

    ; Right arrow (C=67) = next month
    LDI r1, 67
    CMP r3, r1
    JZ r11, next_month

    ; Up arrow (A=65) = previous year
    LDI r1, 65
    CMP r3, r1
    JZ r11, prev_year

    ; Down arrow (B=66) = next year
    LDI r1, 66
    CMP r3, r1
    JZ r11, next_year

    ; ESC = quit
    LDI r1, 27
    CMP r3, r1
    JZ r11, cal_quit

    JMP no_input

prev_month:
    LDI r20, MONTH
    LOAD r0, r20
    LDI r1, 1
    SUB r0, r1
    JNZ r0, pm_store
    LDI r0, 12
    LDI r20, YEAR
    LOAD r16, r20
    LDI r1, 1
    SUB r16, r1
    STORE r20, r16
    LDI r20, MONTH
pm_store:
    STORE r20, r0
    CALL compute_month
    JMP no_input

next_month:
    LDI r20, MONTH
    LOAD r0, r20
    LDI r1, 1
    ADD r0, r1
    LDI r1, 13
    CMP r0, r1
    JZ r11, nm_wrap
    STORE r20, r0
    CALL compute_month
    JMP no_input

nm_wrap:
    LDI r0, 1
    STORE r20, r0
    LDI r20, YEAR
    LOAD r0, r20
    LDI r1, 1
    ADD r0, r1
    STORE r20, r0
    CALL compute_month
    JMP no_input

prev_year:
    LDI r20, YEAR
    LOAD r0, r20
    LDI r1, 1
    SUB r0, r1
    STORE r20, r0
    CALL compute_month
    JMP no_input

next_year:
    LDI r20, YEAR
    LOAD r0, r20
    LDI r1, 1
    ADD r0, r1
    STORE r20, r0
    CALL compute_month
    JMP no_input

no_input:
    ; Update blink
    LDI r20, TICKS
    LOAD r0, r20
    LDI r1, 30
    DIV r0, r1
    LDI r20, BLINK
    STORE r20, r0

    ; Render
    CALL render_calendar

    FRAME
    JMP main_loop

cal_quit:
    HALT

; =========================================
; compute_month -- calculate days in month and first day
; Uses: r3-r19
; =========================================
compute_month:
    PUSH r31

    LDI r20, MONTH
    LOAD r3, r20       ; r3 = month (1-12)
    LDI r20, YEAR
    LOAD r1, r20       ; r1 = year

    ; Compute days in month
    LDI r8, 2
    CMP r3, r8
    JZ r11, feb_days

    ; Non-Feb: 30 days for Apr,Jun,Sep,Nov; 31 for rest
    LDI r8, 31
    LDI r2, 4
    CMP r3, r2
    JZ r11, set_30
    LDI r2, 6
    CMP r3, r2
    JZ r11, set_30
    LDI r2, 9
    CMP r3, r2
    JZ r11, set_30
    LDI r2, 11
    CMP r3, r2
    JZ r11, set_30
    JMP store_mdays

set_30:
    LDI r8, 30
    JMP store_mdays

feb_days:
    LDI r8, 28
    MOV r2, r1
    LDI r5, 4
    MOD r2, r5
    JNZ r2, store_mdays
    MOV r2, r1
    LDI r5, 100
    MOD r2, r5
    JNZ r2, is_leap
    MOV r2, r1
    LDI r5, 400
    MOD r2, r5
    JNZ r2, store_mdays

is_leap:
    LDI r8, 29

store_mdays:
    LDI r20, MDAYS
    STORE r20, r8

    ; Zeller congruence for first day
    MOV r2, r3
    MOV r5, r1

    ; Jan->13, Feb->14, year--
    LDI r0, 3
    CMP r2, r0
    BGE r11, zeller_ok
    LDI r0, 12
    ADD r2, r0
    LDI r0, 1
    SUB r5, r0

zeller_ok:
    ; K = year % 100
    MOV r0, r5
    LDI r16, 100
    MOD r0, r16

    ; J = year / 100
    MOV r16, r5
    LDI r17, 100
    DIV r16, r17

    ; (13*(m+1))/5
    LDI r17, 1
    ADD r2, r17
    LDI r17, 13
    MUL r2, r17
    LDI r17, 5
    DIV r2, r17

    ; h = 1 + 13*(m+1)/5 + K + K/4 + J/4 + 5*J
    LDI r17, 1
    ADD r17, r2
    ADD r17, r0
    MOV r18, r0
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
; Uses: r15-r13
; =========================================
render_calendar:
    PUSH r31

    ; Background
    LDI r15, 0x0D1B2A
    FILL r15

    ; Title bar
    LDI r15, 0
    LDI r14, 0
    LDI r9, 256
    LDI r4, 28
    LDI r12, 0x1B3A5C
    RECTF r15, r14, r9, r4, r12

    ; Month name in title
    LDI r20, MONTH
    LOAD r3, r20
    LDI r20, BUF
    CALL get_month_name
    LDI r15, 8
    LDI r14, 8
    LDI r9, BUF
    LDI r4, 0xFFFFFF
    LDI r12, 0x1B3A5C
    DRAWTEXT r15, r14, r9, r4, r12

    ; Year in title
    LDI r20, YEAR
    LOAD r0, r20
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 80
    LDI r14, 8
    LDI r9, BUF
    LDI r4, 0xFFFFFF
    LDI r12, 0x1B3A5C
    DRAWTEXT r15, r14, r9, r4, r12

    ; =========================================
    ; Day-of-week header row
    ; =========================================
    LDI r12, 0x1A1A3A
    LDI r15, 16
    LDI r14, 32
    LDI r9, 224
    LDI r4, 16
    RECTF r15, r14, r9, r4, r12

    ; S M T W T F S headers
    LDI r15, 22
    LDI r14, 34
    LDI r20, BUF
    STRO r20, "S"
    LDI r9, BUF
    LDI r4, 0x8888BB
    LDI r12, 0x1A1A3A
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 54
    LDI r20, BUF
    STRO r20, "M"
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 86
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 118
    LDI r20, BUF
    STRO r20, "W"
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 150
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 182
    LDI r20, BUF
    STRO r20, "F"
    DRAWTEXT r15, r14, r9, r4, r12

    LDI r15, 214
    LDI r20, BUF
    STRO r20, "S"
    DRAWTEXT r15, r14, r9, r4, r12

    ; =========================================
    ; Draw day grid
    ; =========================================
    LDI r20, FDAY
    LOAD r7, r20          ; r7 = first day (0=Sun..6=Sat)
    LDI r20, MDAYS
    LOAD r13, r20          ; r13 = days in month
    LDI r3, 1            ; r3 = current day (1..31)

    ; Grid layout: 7 columns, each 32px wide, starting at x=16
    ; Row starts at y=50, each row 24px
    LDI r1, 0            ; column counter (0-6)
    MOV r8, r7           ; start column = first day
    LDI r2, 50           ; y position

day_loop:
    ; Check if done
    MOV r5, r13
    LDI r0, 1
    ADD r5, r0
    CMP r3, r5
    BGE r11, days_done

    ; Compute x position: 16 + column * 32 + 4
    MOV r0, r8
    LDI r16, 32
    MUL r0, r16
    LDI r16, 20
    ADD r0, r16          ; r0 = x

    ; Draw day cell background
    LDI r15, 0x16162E
    MOV r14, r2
    LDI r9, 28
    LDI r4, 22
    RECTF r0, r14, r9, r4, r15

    ; Save x position before int_to_str trashes registers
    MOV r10, r8           ; save column
    MOV r6, r2           ; save y

    ; Convert day number to string
    LDI r20, BUF
    MOV r0, r3
    CALL int_to_str

    ; Recompute x for text (centered in cell)
    MOV r0, r10
    LDI r16, 32
    MUL r0, r16
    LDI r16, 26
    ADD r0, r16          ; x for text
    MOV r14, r6            ; restore y
    LDI r16, 4
    ADD r14, r16           ; y offset for text
    LDI r9, BUF
    LDI r4, 0xCCCCFF
    LDI r12, 0x16162E
    DRAWTEXT r0, r14, r9, r4, r12

    ; Advance column
    LDI r16, 1
    ADD r8, r16
    LDI r16, 7
    CMP r8, r16
    BLT r11, same_row

    ; New row
    LDI r8, 0
    LDI r16, 24
    ADD r2, r16

same_row:
    ; Next day
    LDI r16, 1
    ADD r3, r16
    JMP day_loop

days_done:
    ; =========================================
    ; Footer
    ; =========================================
    LDI r15, 0
    LDI r14, 236
    LDI r9, 256
    LDI r4, 20
    LDI r12, 0x0A0A1A
    RECTF r15, r14, r9, r4, r12

    LDI r20, BUF
    STRO r20, "Arrows: navigate  ESC: quit"
    LDI r15, 40
    LDI r14, 240
    LDI r9, BUF
    LDI r4, 0x6666AA
    LDI r12, 0x0A0A1A
    DRAWTEXT r15, r14, r9, r4, r12

    POP r31
    RET

; =========================================
; get_month_name -- write month name to BUF
; Input: r3 = month (1-12), r20 = buffer addr
; =========================================
get_month_name:
    PUSH r31

    LDI r1, 1
    CMP r3, r1
    JZ r11, gm_jan

    LDI r1, 2
    CMP r3, r1
    JZ r11, gm_feb

    LDI r1, 3
    CMP r3, r1
    JZ r11, gm_mar

    LDI r1, 4
    CMP r3, r1
    JZ r11, gm_apr

    LDI r1, 5
    CMP r3, r1
    JZ r11, gm_may

    LDI r1, 6
    CMP r3, r1
    JZ r11, gm_jun

    LDI r1, 7
    CMP r3, r1
    JZ r11, gm_jul

    LDI r1, 8
    CMP r3, r1
    JZ r11, gm_aug

    LDI r1, 9
    CMP r3, r1
    JZ r11, gm_sep

    LDI r1, 10
    CMP r3, r1
    JZ r11, gm_oct

    LDI r1, 11
    CMP r3, r1
    JZ r11, gm_nov

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
; Converts r0 (u32) to decimal string at r20
; Destroys r0-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
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
