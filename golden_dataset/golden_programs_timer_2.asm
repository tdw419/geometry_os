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
    LDI r7, 1
    LDI r14, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r15, 6000
    STORE r20, r15
    LDI r20, INIT_TIME
    STORE r20, r15

    LDI r20, RUNNING
    STORE r20, r14
    LDI r20, FRAME_ACC
    STORE r20, r14
    LDI r20, ALARMED
    STORE r20, r14

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r7, 1

    ; Read keyboard
    IKEY r3

    ; Check for digit keys 1-9 to set minutes
    CMPI r3, 49         ; '1'
    BLT r0, not_digit
    CMPI r3, 57         ; '9'
    BGE r0, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r3, 48         ; minutes (1-9)
    LDI r6, 6000
    MUL r3, r6          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r3
    LDI r20, INIT_TIME
    STORE r20, r3
    LDI r20, ALARMED
    LDI r14, 0
    STORE r20, r14
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r3, 32
    JNZ r0, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r6, r20
    CMPI r6, 1
    JZ r0, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r6, r20
    CMPI r6, 0
    JNZ r0, was_running
    LDI r6, 1
    STORE r20, r6
    JMP main_loop
was_running:
    LDI r6, 0
    STORE r20, r6
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r3, 82
    JNZ r0, not_reset
    LDI r14, 0
    LDI r20, RUNNING
    STORE r20, r14
    LDI r20, FRAME_ACC
    STORE r20, r14
    LDI r20, ALARMED
    STORE r20, r14
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r15, r20
    LDI r20, TIMER_CS
    STORE r20, r15
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r6, r20
    CMPI r6, 0
    JZ r0, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r6, r20
    ADDI r6, 1
    STORE r20, r6

    ; Check if 60 frames passed
    CMPI r6, 60
    BLT r0, skip_update

    ; Reset frame acc
    LDI r6, 0
    LDI r20, FRAME_ACC
    STORE r20, r6

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r6, r20
    SUBI r6, 100
    STORE r20, r6

    ; Check if timer reached 0
    CMPI r6, 0
    BGE r0, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r6, 0
    LDI r20, TIMER_CS
    STORE r20, r6
    LDI r20, RUNNING
    STORE r20, r6
    LDI r6, 1
    LDI r20, ALARMED
    STORE r20, r6

    ; Play alarm sound (880Hz, 500ms)
    LDI r2, 880
    LDI r9, 500
    BEEP r2, r9

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r7, 1

    ; Background
    LDI r14, 0x1A0A2E
    FILL r14

    ; Title bar
    LDI r14, 0x2A1A3E
    LDI r15, 0
    LDI r12, 0
    LDI r3, 256
    LDI r6, 24
    RECTF r15, r12, r3, r6, r14

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r15, 100
    LDI r12, 6
    LDI r20, TXT_BUF
    TEXT r15, r12, r20

    ; Main display panel
    LDI r14, 0x0A0616
    LDI r15, 30
    LDI r12, 40
    LDI r3, 196
    LDI r6, 80
    RECTF r15, r12, r3, r6, r14

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r2, r20

    ; Minutes = timer / 6000
    LDI r9, 6000
    MOV r1, r2
    DIV r1, r9

    ; Remaining = timer % 6000
    MOV r13, r2
    MOD r13, r9

    ; Seconds = remaining / 100
    LDI r10, 100
    MOV r5, r13
    DIV r5, r10

    ; Centiseconds = remaining % 100
    MOV r16, r13
    MOD r16, r10

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r1, r1
    CALL fmt_2digit
    LDI r14, 0x3A       ; ':'
    STORE r20, r14
    ADDI r20, 1
    MOV r1, r5
    CALL fmt_2digit
    LDI r14, 0x2E       ; '.'
    STORE r20, r14
    ADDI r20, 1
    MOV r1, r16
    CALL fmt_2digit
    LDI r14, 0
    STORE r20, r14

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r6, r20
    CMPI r6, 1
    JNZ r0, time_normal
    LDI r3, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r3, 0x00FF00   ; green normally
draw_time:
    LDI r15, 60
    LDI r12, 65
    LDI r20, TXT_BUF
    DRAWTEXT r15, r12, r20, r3, r3

    ; Status panel
    LDI r14, 0x0D0D1A
    LDI r15, 30
    LDI r12, 130
    LDI r3, 196
    LDI r6, 50
    RECTF r15, r12, r3, r6, r14

    ; Show state text
    LDI r20, ALARMED
    LOAD r6, r20
    CMPI r6, 1
    JNZ r0, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r15, 85
    LDI r12, 145
    LDI r3, 0xFF4444
    DRAWTEXT r15, r12, r20, r3, r3
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r6, r20
    CMPI r6, 0
    JNZ r0, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r15, 45
    LDI r12, 145
    LDI r3, 0x888888
    DRAWTEXT r15, r12, r20, r3, r3
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r15, 50
    LDI r12, 145
    LDI r3, 0x44FF44
    DRAWTEXT r15, r12, r20, r3, r3

status_done:
    ; Bottom info bar
    LDI r14, 0x0A0A1A
    LDI r15, 0
    LDI r12, 220
    LDI r3, 256
    LDI r6, 36
    RECTF r15, r12, r3, r6, r14

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r15, 20
    LDI r12, 228
    LDI r3, 0x666666
    DRAWTEXT r15, r12, r20, r3, r3

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r1
    DIV r22, r21
    MOV r23, r1
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
