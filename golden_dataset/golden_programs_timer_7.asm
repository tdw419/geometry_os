; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r6, 1
    LDI r3, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r8, 6000
    STORE r20, r8
    LDI r20, INIT_TIME
    STORE r20, r8

    LDI r20, RUNNING
    STORE r20, r3
    LDI r20, FRAME_ACC
    STORE r20, r3
    LDI r20, ALARMED
    STORE r20, r3

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r6, 1

    ; Read keyboard
    IKEY r13

    ; Check for digit keys 1-9 to set minutes
    CMPI r13, 49         ; '1'
    BLT r7, not_digit
    CMPI r13, 57         ; '9'
    BGE r7, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r13, 48         ; minutes (1-9)
    LDI r12, 6000
    MUL r13, r12          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r13
    LDI r20, INIT_TIME
    STORE r20, r13
    LDI r20, ALARMED
    LDI r3, 0
    STORE r20, r3
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r13, 32
    JNZ r7, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r12, r20
    CMPI r12, 1
    JZ r7, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 0
    JNZ r7, was_running
    LDI r12, 1
    STORE r20, r12
    JMP main_loop
was_running:
    LDI r12, 0
    STORE r20, r12
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r13, 82
    JNZ r7, not_reset
    LDI r3, 0
    LDI r20, RUNNING
    STORE r20, r3
    LDI r20, FRAME_ACC
    STORE r20, r3
    LDI r20, ALARMED
    STORE r20, r3
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r8, r20
    LDI r20, TIMER_CS
    STORE r20, r8
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 0
    JZ r7, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r12, r20
    ADDI r12, 1
    STORE r20, r12

    ; Check if 60 frames passed
    CMPI r12, 60
    BLT r7, skip_update

    ; Reset frame acc
    LDI r12, 0
    LDI r20, FRAME_ACC
    STORE r20, r12

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r12, r20
    SUBI r12, 100
    STORE r20, r12

    ; Check if timer reached 0
    CMPI r12, 0
    BGE r7, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r12, 0
    LDI r20, TIMER_CS
    STORE r20, r12
    LDI r20, RUNNING
    STORE r20, r12
    LDI r12, 1
    LDI r20, ALARMED
    STORE r20, r12

    ; Play alarm sound (880Hz, 500ms)
    LDI r4, 880
    LDI r9, 500
    BEEP r4, r9

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r6, 1

    ; Background
    LDI r3, 0x1A0A2E
    FILL r3

    ; Title bar
    LDI r3, 0x2A1A3E
    LDI r8, 0
    LDI r11, 0
    LDI r13, 256
    LDI r12, 24
    RECTF r8, r11, r13, r12, r3

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r8, 100
    LDI r11, 6
    LDI r20, TXT_BUF
    TEXT r8, r11, r20

    ; Main display panel
    LDI r3, 0x0A0616
    LDI r8, 30
    LDI r11, 40
    LDI r13, 196
    LDI r12, 80
    RECTF r8, r11, r13, r12, r3

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r4, r20

    ; Minutes = timer / 6000
    LDI r9, 6000
    MOV r5, r4
    DIV r5, r9

    ; Remaining = timer % 6000
    MOV r10, r4
    MOD r10, r9

    ; Seconds = remaining / 100
    LDI r15, 100
    MOV r0, r10
    DIV r0, r15

    ; Centiseconds = remaining % 100
    MOV r16, r10
    MOD r16, r15

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r5, r5
    CALL fmt_2digit
    LDI r3, 0x3A       ; ':'
    STORE r20, r3
    ADDI r20, 1
    MOV r5, r0
    CALL fmt_2digit
    LDI r3, 0x2E       ; '.'
    STORE r20, r3
    ADDI r20, 1
    MOV r5, r16
    CALL fmt_2digit
    LDI r3, 0
    STORE r20, r3

    ; Draw time - green normally, red when alarm
    LDI r20, ALARMED
    LOAD r12, r20
    CMPI r12, 1
    JNZ r7, time_normal
    LDI r13, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r13, 0x00FF00   ; green normally
draw_time:
    LDI r8, 60
    LDI r11, 65
    LDI r20, TXT_BUF
    DRAWTEXT r8, r11, r20, r13, r13

    ; Status panel
    LDI r3, 0x0D0D1A
    LDI r8, 30
    LDI r11, 130
    LDI r13, 196
    LDI r12, 50
    RECTF r8, r11, r13, r12, r3

    ; Show state text
    LDI r20, ALARMED
    LOAD r12, r20
    CMPI r12, 1
    JNZ r7, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r8, 85
    LDI r11, 145
    LDI r13, 0xFF4444
    DRAWTEXT r8, r11, r20, r13, r13
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 0
    JNZ r7, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r8, 45
    LDI r11, 145
    LDI r13, 0x888888
    DRAWTEXT r8, r11, r20, r13, r13
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r8, 50
    LDI r11, 145
    LDI r13, 0x44FF44
    DRAWTEXT r8, r11, r20, r13, r13

status_done:
    ; Bottom info bar
    LDI r3, 0x0A0A1A
    LDI r8, 0
    LDI r11, 220
    LDI r13, 256
    LDI r12, 36
    RECTF r8, r11, r13, r12, r3

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r8, 20
    LDI r11, 228
    LDI r13, 0x666666
    DRAWTEXT r8, r11, r20, r13, r13

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r5
    DIV r22, r21
    MOV r23, r5
    MOD r23, r21
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
