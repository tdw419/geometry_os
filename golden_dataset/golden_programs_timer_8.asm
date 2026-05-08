; DESCRIPTION: Render a colored object at the screen.

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
    LDI r14, 1
    LDI r11, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r5, 6000
    STORE r20, r5
    LDI r20, INIT_TIME
    STORE r20, r5

    LDI r20, RUNNING
    STORE r20, r11
    LDI r20, FRAME_ACC
    STORE r20, r11
    LDI r20, ALARMED
    STORE r20, r11

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r14, 1

    ; Read keyboard
    IKEY r7

    ; Check for digit keys 1-9 to set minutes
    CMPI r7, 49         ; '1'
    BLT r13, not_digit
    CMPI r7, 57         ; '9'
    BGE r13, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r7, 48         ; minutes (1-9)
    LDI r3, 6000
    MUL r7, r3          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r7
    LDI r20, INIT_TIME
    STORE r20, r7
    LDI r20, ALARMED
    LDI r11, 0
    STORE r20, r11
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r7, 32
    JNZ r13, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r3, r20
    CMPI r3, 1
    JZ r13, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r3, r20
    CMPI r3, 0
    JNZ r13, was_running
    LDI r3, 1
    STORE r20, r3
    JMP main_loop
was_running:
    LDI r3, 0
    STORE r20, r3
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r7, 82
    JNZ r13, not_reset
    LDI r11, 0
    LDI r20, RUNNING
    STORE r20, r11
    LDI r20, FRAME_ACC
    STORE r20, r11
    LDI r20, ALARMED
    STORE r20, r11
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r5, r20
    LDI r20, TIMER_CS
    STORE r20, r5
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r3, r20
    CMPI r3, 0
    JZ r13, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r3, r20
    ADDI r3, 1
    STORE r20, r3

    ; Check if 60 frames passed
    CMPI r3, 60
    BLT r13, skip_update

    ; Reset frame acc
    LDI r3, 0
    LDI r20, FRAME_ACC
    STORE r20, r3

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r3, r20
    SUBI r3, 100
    STORE r20, r3

    ; Check if timer reached 0
    CMPI r3, 0
    BGE r13, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r3, 0
    LDI r20, TIMER_CS
    STORE r20, r3
    LDI r20, RUNNING
    STORE r20, r3
    LDI r3, 1
    LDI r20, ALARMED
    STORE r20, r3

    ; Play alarm sound (880Hz, 500ms)
    LDI r12, 880
    LDI r8, 500
    BEEP r12, r8

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r14, 1

    ; Background
    LDI r11, 0x1A0A2E
    FILL r11

    ; Title bar
    LDI r11, 0x2A1A3E
    LDI r5, 0
    LDI r9, 0
    LDI r7, 256
    LDI r3, 24
    RECTF r5, r9, r7, r3, r11

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r5, 100
    LDI r9, 6
    LDI r20, TXT_BUF
    TEXT r5, r9, r20

    ; Main display panel
    LDI r11, 0x0A0616
    LDI r5, 30
    LDI r9, 40
    LDI r7, 196
    LDI r3, 80
    RECTF r5, r9, r7, r3, r11

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r12, r20

    ; Minutes = timer / 6000
    LDI r8, 6000
    MOV r10, r12
    DIV r10, r8

    ; Remaining = timer % 6000
    MOV r6, r12
    MOD r6, r8

    ; Seconds = remaining / 100
    LDI r0, 100
    MOV r15, r6
    DIV r15, r0

    ; Centiseconds = remaining % 100
    MOV r16, r6
    MOD r16, r0

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r10, r10
    CALL fmt_2digit
    LDI r11, 0x3A       ; ':'
    STORE r20, r11
    ADDI r20, 1
    MOV r10, r15
    CALL fmt_2digit
    LDI r11, 0x2E       ; '.'
    STORE r20, r11
    ADDI r20, 1
    MOV r10, r16
    CALL fmt_2digit
    LDI r11, 0
    STORE r20, r11

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r3, r20
    CMPI r3, 1
    JNZ r13, time_normal
    LDI r7, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r7, 0x00FF00   ; green normally
draw_time:
    LDI r5, 60
    LDI r9, 65
    LDI r20, TXT_BUF
    DRAWTEXT r5, r9, r20, r7, r7

    ; Status panel
    LDI r11, 0x0D0D1A
    LDI r5, 30
    LDI r9, 130
    LDI r7, 196
    LDI r3, 50
    RECTF r5, r9, r7, r3, r11

    ; Show state text
    LDI r20, ALARMED
    LOAD r3, r20
    CMPI r3, 1
    JNZ r13, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r5, 85
    LDI r9, 145
    LDI r7, 0xFF4444
    DRAWTEXT r5, r9, r20, r7, r7
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r3, r20
    CMPI r3, 0
    JNZ r13, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r5, 45
    LDI r9, 145
    LDI r7, 0x888888
    DRAWTEXT r5, r9, r20, r7, r7
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r5, 50
    LDI r9, 145
    LDI r7, 0x44FF44
    DRAWTEXT r5, r9, r20, r7, r7

status_done:
    ; Bottom info bar
    LDI r11, 0x0A0A1A
    LDI r5, 0
    LDI r9, 220
    LDI r7, 256
    LDI r3, 36
    RECTF r5, r9, r7, r3, r11

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r5, 20
    LDI r9, 228
    LDI r7, 0x666666
    DRAWTEXT r5, r9, r20, r7, r7

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r10
    DIV r22, r21
    MOV r23, r10
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
