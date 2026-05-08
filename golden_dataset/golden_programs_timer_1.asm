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
    LDI r11, 1
    LDI r6, 0

    ; Default timer = 60 seconds = 6000 centiseconds (1 minute)
    LDI r20, TIMER_CS
    LDI r5, 6000
    STORE r20, r5
    LDI r20, INIT_TIME
    STORE r20, r5

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
    LDI r11, 1

    ; Read keyboard
    IKEY r14

    ; Check for digit keys 1-9 to set minutes
    CMPI r14, 49         ; '1'
    BLT r15, not_digit
    CMPI r14, 57         ; '9'
    BGE r15, not_digit

    ; Set timer to (key - 48) minutes = (key - 48) * 6000 cs
    SUBI r14, 48         ; minutes (1-9)
    LDI r13, 6000
    MUL r14, r13          ; total cs
    LDI r20, TIMER_CS
    STORE r20, r14
    LDI r20, INIT_TIME
    STORE r20, r14
    LDI r20, ALARMED
    LDI r6, 0
    STORE r20, r6
    JMP main_loop

not_digit:
    ; Space (32) = start/pause
    CMPI r14, 32
    JNZ r15, not_space

    ; Don't start if timer is 0 and alarm was triggered
    LDI r20, ALARMED
    LOAD r13, r20
    CMPI r13, 1
    JZ r15, main_loop

    ; Toggle running
    LDI r20, RUNNING
    LOAD r13, r20
    CMPI r13, 0
    JNZ r15, was_running
    LDI r13, 1
    STORE r20, r13
    JMP main_loop
was_running:
    LDI r13, 0
    STORE r20, r13
    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r14, 82
    JNZ r15, not_reset
    LDI r6, 0
    LDI r20, RUNNING
    STORE r20, r6
    LDI r20, FRAME_ACC
    STORE r20, r6
    LDI r20, ALARMED
    STORE r20, r6
    ; Restore initial time
    LDI r20, INIT_TIME
    LOAD r5, r20
    LDI r20, TIMER_CS
    STORE r20, r5
    JMP main_loop

not_reset:
    ; Update timer if running
    LDI r20, RUNNING
    LOAD r13, r20
    CMPI r13, 0
    JZ r15, skip_update

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r13, r20
    ADDI r13, 1
    STORE r20, r13

    ; Check if 60 frames passed
    CMPI r13, 60
    BLT r15, skip_update

    ; Reset frame acc
    LDI r13, 0
    LDI r20, FRAME_ACC
    STORE r20, r13

    ; timer_cs -= 100
    LDI r20, TIMER_CS
    LOAD r13, r20
    SUBI r13, 100
    STORE r20, r13

    ; Check if timer reached 0
    CMPI r13, 0
    BGE r15, skip_update  ; still positive, keep going

    ; Timer hit zero - stop and alarm
    LDI r13, 0
    LDI r20, TIMER_CS
    STORE r20, r13
    LDI r20, RUNNING
    STORE r20, r13
    LDI r13, 1
    LDI r20, ALARMED
    STORE r20, r13

    ; Play alarm sound (880Hz, 500ms)
    LDI r0, 880
    LDI r8, 500
    BEEP r0, r8

skip_update:
    ; Render
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r11, 1

    ; Background
    LDI r6, 0x1A0A2E
    FILL r6

    ; Title bar
    LDI r6, 0x2A1A3E
    LDI r5, 0
    LDI r3, 0
    LDI r14, 256
    LDI r13, 24
    RECTF r5, r3, r14, r13, r6

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "TIMER"
    LDI r5, 100
    LDI r3, 6
    LDI r20, TXT_BUF
    TEXT r5, r3, r20

    ; Main display panel
    LDI r6, 0x0A0616
    LDI r5, 30
    LDI r3, 40
    LDI r14, 196
    LDI r13, 80
    RECTF r5, r3, r14, r13, r6

    ; Compute time from centiseconds
    LDI r20, TIMER_CS
    LOAD r0, r20

    ; Minutes = timer / 6000
    LDI r8, 6000
    MOV r7, r0
    DIV r7, r8

    ; Remaining = timer % 6000
    MOV r12, r0
    MOD r12, r8

    ; Seconds = remaining / 100
    LDI r2, 100
    MOV r10, r12
    DIV r10, r2

    ; Centiseconds = remaining % 100
    MOV r16, r12
    MOD r16, r2

    ; Build MM:SS.CC string
    LDI r20, TXT_BUF
    MOV r7, r7
    CALL fmt_2digit
    LDI r6, 0x3A       ; ':'
    STORE r20, r6
    ADDI r20, 1
    MOV r7, r10
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
    LOAD r13, r20
    CMPI r13, 1
    JNZ r15, time_normal
    LDI r14, 0xFF2222   ; red when alarm
    JMP draw_time
time_normal:
    LDI r14, 0x00FF00   ; green normally
draw_time:
    LDI r5, 60
    LDI r3, 65
    LDI r20, TXT_BUF
    DRAWTEXT r5, r3, r20, r14, r14

    ; Status panel
    LDI r6, 0x0D0D1A
    LDI r5, 30
    LDI r3, 130
    LDI r14, 196
    LDI r13, 50
    RECTF r5, r3, r14, r13, r6

    ; Show state text
    LDI r20, ALARMED
    LOAD r13, r20
    CMPI r13, 1
    JNZ r15, not_alarm_show

    ; "ALARM!" text
    LDI r20, TXT_BUF
    STRO r20, "ALARM!"
    LDI r5, 85
    LDI r3, 145
    LDI r14, 0xFF4444
    DRAWTEXT r5, r3, r20, r14, r14
    JMP status_done

not_alarm_show:
    LDI r20, RUNNING
    LOAD r13, r20
    CMPI r13, 0
    JNZ r15, timer_running

    ; "PAUSED" text
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 or Space"
    LDI r5, 45
    LDI r3, 145
    LDI r14, 0x888888
    DRAWTEXT r5, r3, r20, r14, r14
    JMP status_done

timer_running:
    LDI r20, TXT_BUF
    STRO r20, "COUNTING DOWN..."
    LDI r5, 50
    LDI r3, 145
    LDI r14, 0x44FF44
    DRAWTEXT r5, r3, r20, r14, r14

status_done:
    ; Bottom info bar
    LDI r6, 0x0A0A1A
    LDI r5, 0
    LDI r3, 220
    LDI r14, 256
    LDI r13, 36
    RECTF r5, r3, r14, r13, r6

    ; Controls hint
    LDI r20, TXT_BUF
    STRO r20, "1-9:mins  Space:start  R:reset"
    LDI r5, 20
    LDI r3, 228
    LDI r14, 0x666666
    DRAWTEXT r5, r3, r20, r14, r14

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
