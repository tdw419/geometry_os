; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
    LDI r4, 1
    LDI r6, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r0, 6000
    STORE r20, r0
    LDI r20, INIT_TIME
    STORE r20, r0

    LDI r20, RUNNING
    STORE r20, r6
    LDI r20, FRAME_ACC
    STORE r20, r6
    LDI r20, ALARMED
    STORE r20, r6

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r4, 1

    ; Read keyboard
    IKEY r15

    ; Check for digit keys 1-9 to set minutes
    CMPI r15, 49         ; '1'
    BLT r9, not_digit
    CMPI r15, 57         ; '9'
    BGE r9, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r15, 48         ; minutes (1-9)
    LDI r11, 6000
    MUL r15, r11          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r15
    LDI r20, INIT_TIME
    STORE r20, r15
    LDI r20, ALARMED
    LDI r6, 0
    STORE r20, r6
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r15, 32
    JNZ r9, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r11, r20
    CMPI r11, 1
    JZ r9, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 0
    JNZ r9, was_running
    LDI r11, 1
    STORE r20, r11
    JMP main_loop
was_running:
    LDI r11, 0
    STORE r20, r11
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r15, 82
    JNZ r9, not_reset
    LDI r6, 0
    LDI r20, RUNNING
    STORE r20, r6
    LDI r20, FRAME_ACC
    STORE r20, r6
    LDI r20, ALARMED
    STORE r20, r6
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r0, r20
    LDI r20, TIMER_CS
    STORE r20, r0
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 0
    JZ r9, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r11, r20
    ADDI r11, 1
    STORE r20, r11

    ; Check if 60 frames passed
    CMPI r11, 60
    BLT r9, skip_update

    ; Reset frame acc
    LDI r11, 0
    LDI r20, FRAME_ACC
    STORE r20, r11

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r11, r20
    SUBI r11, 100
    STORE r20, r11

    ; Check if timer reached 0
    CMPI r11, 0
    BGE r9, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r11, 0
    LDI r20, TIMER_CS
    STORE r20, r11
    LDI r20, RUNNING
    STORE r20, r11
    LDI r11, 1
    LDI r20, ALARMED
    STORE r20, r11

    ; Play alarm sound (880Hz, 500ms)
    LDI r5, 880
    LDI r1, 500
    BEEP r5, r1

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r4, 1

    ; Background
    LDI r6, 0x1A0A2E
    FILL r6

    ; Title bar
    LDI r6, 0x2A1A3E
    LDI r0, 0
    LDI r10, 0
    LDI r15, 256
    LDI r11, 24
    RECTF r0, r10, r15, r11, r6

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r0, 100
    LDI r10, 6
    LDI r20, TXT_BUF
    TEXT r0, r10, r20

    ; Main display panel
    LDI r6, 0x0A0616
    LDI r0, 30
    LDI r10, 40
    LDI r15, 196
    LDI r11, 80
    RECTF r0, r10, r15, r11, r6

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r5, r20

    ; Minutes = timer / 6000
    LDI r1, 6000
    MOV r7, r5
    DIV r7, r1

    ; Remaining = timer % 6000
    MOV r14, r5
    MOD r14, r1

    ; Seconds = remaining / 100
    LDI r3, 100
    MOV r8, r14
    DIV r8, r3

    ; Centiseconds = remaining % 100
    MOV r16, r14
    MOD r16, r3

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r7, r7
    CALL fmt_2digit
    LDI r6, 0x3A       ; ':'
    STORE r20, r6
    ADDI r20, 1
    MOV r7, r8
    CALL fmt_2digit
    LDI r6, 0x2E       ; '.'
    STORE r20, r6
    ADDI r20, 1
    MOV r7, r16
    CALL fmt_2digit
    LDI r6, 0
    STORE r20, r6

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r11, r20
    CMPI r11, 1
    JNZ r9, time_normal
    LDI r15, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r15, 0x00FF00   ; green normally
draw_time:
    LDI r0, 60
    LDI r10, 65
    LDI r20, TXT_BUF
    DRAWTEXT r0, r10, r20, r15, r15

    ; Status panel
    LDI r6, 0x0D0D1A
    LDI r0, 30
    LDI r10, 130
    LDI r15, 196
    LDI r11, 50
    RECTF r0, r10, r15, r11, r6

    ; Show state text
    LDI r20, ALARMED
    LOAD r11, r20
    CMPI r11, 1
    JNZ r9, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r0, 85
    LDI r10, 145
    LDI r15, 0xFF4444
    DRAWTEXT r0, r10, r20, r15, r15
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 0
    JNZ r9, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r0, 45
    LDI r10, 145
    LDI r15, 0x888888
    DRAWTEXT r0, r10, r20, r15, r15
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r0, 50
    LDI r10, 145
    LDI r15, 0x44FF44
    DRAWTEXT r0, r10, r20, r15, r15

status_done:
    ; Bottom info bar
    LDI r6, 0x0A0A1A
    LDI r0, 0
    LDI r10, 220
    LDI r15, 256
    LDI r11, 36
    RECTF r0, r10, r15, r11, r6

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r0, 20
    LDI r10, 228
    LDI r15, 0x666666
    DRAWTEXT r0, r10, r20, r15, r15

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r7
    DIV r22, r21
    MOV r23, r7
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
