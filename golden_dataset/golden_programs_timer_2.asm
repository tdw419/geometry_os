; DESCRIPTION: Geometry OS program to draw a colored object.

; timer.asm -- Countdown Timer with Alarm for Geometry OS
;
; Phase 75: Countdown timer. Enter time, press start, alarm on zero.
; Proves FRAME timing, BEEP audio, IKEY keyboard, RAM state.
;
; Controls:
;   1-9   = Set minutes (1-9)
;   Space = Start/Pause
;   R     = Reset to zero
;
; Timing:
;   60 frames = 1 second
;   Timer stored in centiseconds (100 per second)
;   When timer reaches 0, play alarm via BEEP
;
; RAM Layout:
;   0x4000 = timer centiseconds remaining
;   0x4004 = running flag (0=stopped, 1=running)
;   0x4008 = frame accumulator (0-59)
;   0x400C = alarm triggered flag (0=no, 1=yes)
;   0x4010 = initial time (for display)
;   0x5000 = text buffer
;
; NOTE: No colons in comments (assembler pitfall)

#define TIMER_CS    0x4000
#define RUNNING     0x4004
#define FRAME_ACC   0x4008
#define ALARMED     0x400C
#define INIT_TIME   0x4010
#define TXT_BUF     0x5000

; ── INIT ──────────────────────────────────────────
    LDI r10, 1
    LDI r0, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r3, 6000
    STORE r20, r3
    LDI r20, INIT_TIME
    STORE r20, r3

    LDI r20, RUNNING
    STORE r20, r0
    LDI r20, FRAME_ACC
    STORE r20, r0
    LDI r20, ALARMED
    STORE r20, r0

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r10, 1

    ; Read keyboard
    IKEY r5

    ; Check for digit keys 1-9 to set minutes
    CMPI r5, 49         ; '1'
    BLT r12, not_digit
    CMPI r5, 57         ; '9'
    BGE r12, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r5, 48         ; minutes (1-9)
    LDI r2, 6000
    MUL r5, r2          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r5
    LDI r20, INIT_TIME
    STORE r20, r5
    LDI r20, ALARMED
    LDI r0, 0
    STORE r20, r0
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r5, 32
    JNZ r12, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r2, r20
    CMPI r2, 1
    JZ r12, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r2, r20
    CMPI r2, 0
    JNZ r12, was_running
    LDI r2, 1
    STORE r20, r2
    JMP main_loop
was_running:
    LDI r2, 0
    STORE r20, r2
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r5, 82
    JNZ r12, not_reset
    LDI r0, 0
    LDI r20, RUNNING
    STORE r20, r0
    LDI r20, FRAME_ACC
    STORE r20, r0
    LDI r20, ALARMED
    STORE r20, r0
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r3, r20
    LDI r20, TIMER_CS
    STORE r20, r3
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r2, r20
    CMPI r2, 0
    JZ r12, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r2, r20
    ADDI r2, 1
    STORE r20, r2

    ; Check if 60 frames passed
    CMPI r2, 60
    BLT r12, skip_update

    ; Reset frame acc
    LDI r2, 0
    LDI r20, FRAME_ACC
    STORE r20, r2

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r2, r20
    SUBI r2, 100
    STORE r20, r2

    ; Check if timer reached 0
    CMPI r2, 0
    BGE r12, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r2, 0
    LDI r20, TIMER_CS
    STORE r20, r2
    LDI r20, RUNNING
    STORE r20, r2
    LDI r2, 1
    LDI r20, ALARMED
    STORE r20, r2

    ; Play alarm sound (880Hz, 500ms)
    LDI r11, 880
    LDI r14, 500
    BEEP r11, r14

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r10, 1

    ; Background
    LDI r0, 0x1A0A2E
    FILL r0

    ; Title bar
    LDI r0, 0x2A1A3E
    LDI r3, 0
    LDI r13, 0
    LDI r5, 256
    LDI r2, 24
    RECTF r3, r13, r5, r2, r0

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r3, 100
    LDI r13, 6
    LDI r20, TXT_BUF
    TEXT r3, r13, r20

    ; Main display panel
    LDI r0, 0x0A0616
    LDI r3, 30
    LDI r13, 40
    LDI r5, 196
    LDI r2, 80
    RECTF r3, r13, r5, r2, r0

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r11, r20

    ; Minutes = timer / 6000
    LDI r14, 6000
    MOV r15, r11
    DIV r15, r14

    ; Remaining = timer % 6000
    MOV r9, r11
    MOD r9, r14

    ; Seconds = remaining / 100
    LDI r6, 100
    MOV r1, r9
    DIV r1, r6

    ; Centiseconds = remaining % 100
    MOV r16, r9
    MOD r16, r6

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r15, r15
    CALL fmt_2digit
    LDI r0, 0x3A       ; ':'
    STORE r20, r0
    ADDI r20, 1
    MOV r15, r1
    CALL fmt_2digit
    LDI r0, 0x2E       ; '.'
    STORE r20, r0
    ADDI r20, 1
    MOV r15, r16
    CALL fmt_2digit
    LDI r0, 0
    STORE r20, r0

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r2, r20
    CMPI r2, 1
    JNZ r12, time_normal
    LDI r5, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r5, 0x00FF00   ; green normally
draw_time:
    LDI r3, 60
    LDI r13, 65
    LDI r20, TXT_BUF
    DRAWTEXT r3, r13, r20, r5, r5

    ; Status panel
    LDI r0, 0x0D0D1A
    LDI r3, 30
    LDI r13, 130
    LDI r5, 196
    LDI r2, 50
    RECTF r3, r13, r5, r2, r0

    ; Show state text
    LDI r20, ALARMED
    LOAD r2, r20
    CMPI r2, 1
    JNZ r12, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r3, 85
    LDI r13, 145
    LDI r5, 0xFF4444
    DRAWTEXT r3, r13, r20, r5, r5
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r2, r20
    CMPI r2, 0
    JNZ r12, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r3, 45
    LDI r13, 145
    LDI r5, 0x888888
    DRAWTEXT r3, r13, r20, r5, r5
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r3, 50
    LDI r13, 145
    LDI r5, 0x44FF44
    DRAWTEXT r3, r13, r20, r5, r5

status_done:
    ; Bottom info bar
    LDI r0, 0x0A0A1A
    LDI r3, 0
    LDI r13, 220
    LDI r5, 256
    LDI r2, 36
    RECTF r3, r13, r5, r2, r0

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r3, 20
    LDI r13, 228
    LDI r5, 0x666666
    DRAWTEXT r3, r13, r20, r5, r5

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r15
    DIV r22, r21
    MOV r23, r15
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
