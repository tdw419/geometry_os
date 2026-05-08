; DESCRIPTION: This GeOS assembly code implements a countdown timer with an alarm feature. The timer is controlled via keyboard inputs to set minutes (1-9), start/pause the timer, and reset it. It uses frame timing for accurate second increments and plays an alarm sound when the timer reaches zero. The timer's state and time are displayed on the screen, along with status messages indicating whether the timer is running or paused.

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
    LDI r2, 1
    LDI r10, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r1, 6000
    STORE r20, r1
    LDI r20, INIT_TIME
    STORE r20, r1

    LDI r20, RUNNING
    STORE r20, r10
    LDI r20, FRAME_ACC
    STORE r20, r10
    LDI r20, ALARMED
    STORE r20, r10

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r2, 1

    ; Read keyboard
    IKEY r12

    ; Check for digit keys 1-9 to set minutes
    CMPI r12, 49         ; '1'
    BLT r0, not_digit
    CMPI r12, 57         ; '9'
    BGE r0, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r12, 48         ; minutes (1-9)
    LDI r9, 6000
    MUL r12, r9          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r12
    LDI r20, INIT_TIME
    STORE r20, r12
    LDI r20, ALARMED
    LDI r10, 0
    STORE r20, r10
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r12, 32
    JNZ r0, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r9, r20
    CMPI r9, 1
    JZ r0, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 0
    JNZ r0, was_running
    LDI r9, 1
    STORE r20, r9
    JMP main_loop
was_running:
    LDI r9, 0
    STORE r20, r9
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r12, 82
    JNZ r0, not_reset
    LDI r10, 0
    LDI r20, RUNNING
    STORE r20, r10
    LDI r20, FRAME_ACC
    STORE r20, r10
    LDI r20, ALARMED
    STORE r20, r10
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r1, r20
    LDI r20, TIMER_CS
    STORE r20, r1
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 0
    JZ r0, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r9, r20
    ADDI r9, 1
    STORE r20, r9

    ; Check if 60 frames passed
    CMPI r9, 60
    BLT r0, skip_update

    ; Reset frame acc
    LDI r9, 0
    LDI r20, FRAME_ACC
    STORE r20, r9

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r9, r20
    SUBI r9, 100
    STORE r20, r9

    ; Check if timer reached 0
    CMPI r9, 0
    BGE r0, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r9, 0
    LDI r20, TIMER_CS
    STORE r20, r9
    LDI r20, RUNNING
    STORE r20, r9
    LDI r9, 1
    LDI r20, ALARMED
    STORE r20, r9

    ; Play alarm sound (880Hz, 500ms)
    LDI r13, 880
    LDI r14, 500
    BEEP r13, r14

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r2, 1

    ; Background
    LDI r10, 0x1A0A2E
    FILL r10

    ; Title bar
    LDI r10, 0x2A1A3E
    LDI r1, 0
    LDI r3, 0
    LDI r12, 256
    LDI r9, 24
    RECTF r1, r3, r12, r9, r10

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r1, 100
    LDI r3, 6
    LDI r20, TXT_BUF
    TEXT r1, r3, r20

    ; Main display panel
    LDI r10, 0x0A0616
    LDI r1, 30
    LDI r3, 40
    LDI r12, 196
    LDI r9, 80
    RECTF r1, r3, r12, r9, r10

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r13, r20

    ; Minutes = timer / 6000
    LDI r14, 6000
    MOV r8, r13
    DIV r8, r14

    ; Remaining = timer % 6000
    MOV r11, r13
    MOD r11, r14

    ; Seconds = remaining / 100
    LDI r7, 100
    MOV r4, r11
    DIV r4, r7

    ; Centiseconds = remaining % 100
    MOV r16, r11
    MOD r16, r7

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r8, r8
    CALL fmt_2digit
    LDI r10, 0x3A       ; ':'
    STORE r20, r10
    ADDI r20, 1
    MOV r8, r4
    CALL fmt_2digit
    LDI r10, 0x2E       ; '.'
    STORE r20, r10
    ADDI r20, 1
    MOV r8, r16
    CALL fmt_2digit
    LDI r10, 0
    STORE r20, r10

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r9, r20
    CMPI r9, 1
    JNZ r0, time_normal
    LDI r12, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r12, 0x00FF00   ; green normally
draw_time:
    LDI r1, 60
    LDI r3, 65
    LDI r20, TXT_BUF
    DRAWTEXT r1, r3, r20, r12, r12

    ; Status panel
    LDI r10, 0x0D0D1A
    LDI r1, 30
    LDI r3, 130
    LDI r12, 196
    LDI r9, 50
    RECTF r1, r3, r12, r9, r10

    ; Show state text
    LDI r20, ALARMED
    LOAD r9, r20
    CMPI r9, 1
    JNZ r0, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r1, 85
    LDI r3, 145
    LDI r12, 0xFF4444
    DRAWTEXT r1, r3, r20, r12, r12
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 0
    JNZ r0, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r1, 45
    LDI r3, 145
    LDI r12, 0x888888
    DRAWTEXT r1, r3, r20, r12, r12
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r1, 50
    LDI r3, 145
    LDI r12, 0x44FF44
    DRAWTEXT r1, r3, r20, r12, r12

status_done:
    ; Bottom info bar
    LDI r10, 0x0A0A1A
    LDI r1, 0
    LDI r3, 220
    LDI r12, 256
    LDI r9, 36
    RECTF r1, r3, r12, r9, r10

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r1, 20
    LDI r3, 228
    LDI r12, 0x666666
    DRAWTEXT r1, r3, r20, r12, r12

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r8
    DIV r22, r21
    MOV r23, r8
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
