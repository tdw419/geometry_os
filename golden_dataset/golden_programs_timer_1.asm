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
    LDI r0, 1
    LDI r7, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r13, 6000
    STORE r20, r13
    LDI r20, INIT_TIME
    STORE r20, r13

    LDI r20, RUNNING
    STORE r20, r7
    LDI r20, FRAME_ACC
    STORE r20, r7
    LDI r20, ALARMED
    STORE r20, r7

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r0, 1

    ; Read keyboard
    IKEY r10

    ; Check for digit keys 1-9 to set minutes
    CMPI r10, 49         ; '1'
    BLT r9, not_digit
    CMPI r10, 57         ; '9'
    BGE r9, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r10, 48         ; minutes (1-9)
    LDI r8, 6000
    MUL r10, r8          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r10
    LDI r20, INIT_TIME
    STORE r20, r10
    LDI r20, ALARMED
    LDI r7, 0
    STORE r20, r7
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r10, 32
    JNZ r9, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r8, r20
    CMPI r8, 1
    JZ r9, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 0
    JNZ r9, was_running
    LDI r8, 1
    STORE r20, r8
    JMP main_loop
was_running:
    LDI r8, 0
    STORE r20, r8
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r10, 82
    JNZ r9, not_reset
    LDI r7, 0
    LDI r20, RUNNING
    STORE r20, r7
    LDI r20, FRAME_ACC
    STORE r20, r7
    LDI r20, ALARMED
    STORE r20, r7
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r13, r20
    LDI r20, TIMER_CS
    STORE r20, r13
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 0
    JZ r9, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r8, r20
    ADDI r8, 1
    STORE r20, r8

    ; Check if 60 frames passed
    CMPI r8, 60
    BLT r9, skip_update

    ; Reset frame acc
    LDI r8, 0
    LDI r20, FRAME_ACC
    STORE r20, r8

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r8, r20
    SUBI r8, 100
    STORE r20, r8

    ; Check if timer reached 0
    CMPI r8, 0
    BGE r9, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r8, 0
    LDI r20, TIMER_CS
    STORE r20, r8
    LDI r20, RUNNING
    STORE r20, r8
    LDI r8, 1
    LDI r20, ALARMED
    STORE r20, r8

    ; Play alarm sound (880Hz, 500ms)
    LDI r4, 880
    LDI r11, 500
    BEEP r4, r11

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r0, 1

    ; Background
    LDI r7, 0x1A0A2E
    FILL r7

    ; Title bar
    LDI r7, 0x2A1A3E
    LDI r13, 0
    LDI r15, 0
    LDI r10, 256
    LDI r8, 24
    RECTF r13, r15, r10, r8, r7

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r13, 100
    LDI r15, 6
    LDI r20, TXT_BUF
    TEXT r13, r15, r20

    ; Main display panel
    LDI r7, 0x0A0616
    LDI r13, 30
    LDI r15, 40
    LDI r10, 196
    LDI r8, 80
    RECTF r13, r15, r10, r8, r7

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r4, r20

    ; Minutes = timer / 6000
    LDI r11, 6000
    MOV r14, r4
    DIV r14, r11

    ; Remaining = timer % 6000
    MOV r3, r4
    MOD r3, r11

    ; Seconds = remaining / 100
    LDI r12, 100
    MOV r2, r3
    DIV r2, r12

    ; Centiseconds = remaining % 100
    MOV r16, r3
    MOD r16, r12

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r14, r14
    CALL fmt_2digit
    LDI r7, 0x3A       ; ':'
    STORE r20, r7
    ADDI r20, 1
    MOV r14, r2
    CALL fmt_2digit
    LDI r7, 0x2E       ; '.'
    STORE r20, r7
    ADDI r20, 1
    MOV r14, r16
    CALL fmt_2digit
    LDI r7, 0
    STORE r20, r7

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r8, r20
    CMPI r8, 1
    JNZ r9, time_normal
    LDI r10, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r10, 0x00FF00   ; green normally
draw_time:
    LDI r13, 60
    LDI r15, 65
    LDI r20, TXT_BUF
    DRAWTEXT r13, r15, r20, r10, r10

    ; Status panel
    LDI r7, 0x0D0D1A
    LDI r13, 30
    LDI r15, 130
    LDI r10, 196
    LDI r8, 50
    RECTF r13, r15, r10, r8, r7

    ; Show state text
    LDI r20, ALARMED
    LOAD r8, r20
    CMPI r8, 1
    JNZ r9, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r13, 85
    LDI r15, 145
    LDI r10, 0xFF4444
    DRAWTEXT r13, r15, r20, r10, r10
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 0
    JNZ r9, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r13, 45
    LDI r15, 145
    LDI r10, 0x888888
    DRAWTEXT r13, r15, r20, r10, r10
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r13, 50
    LDI r15, 145
    LDI r10, 0x44FF44
    DRAWTEXT r13, r15, r20, r10, r10

status_done:
    ; Bottom info bar
    LDI r7, 0x0A0A1A
    LDI r13, 0
    LDI r15, 220
    LDI r10, 256
    LDI r8, 36
    RECTF r13, r15, r10, r8, r7

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r13, 20
    LDI r15, 228
    LDI r10, 0x666666
    DRAWTEXT r13, r15, r20, r10, r10

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r14
    DIV r22, r21
    MOV r23, r14
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
