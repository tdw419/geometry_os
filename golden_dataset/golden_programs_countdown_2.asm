; DESCRIPTION: The GeOS assembly code implements a wall-clock countdown timer using the TMR_GET and ALARM_SET opcodes. It allows users to set countdown seconds (1-9), start the countdown with spacebar, and reset with 'R'. The timer uses real-time milliseconds since VM start for accurate timing and displays the remaining time dynamically, updating in real-time.

; countdown.asm -- Wall-Clock Countdown Timer for Geometry OS
;
; Phase 222: Demonstrates TMR_GET and ALARM_SET opcodes.
; Uses real wall-clock time instead of frame counting.
;
; Controls:
;   1-9   = Set countdown seconds (1-9)
;   Space = Start countdown
;   R     = Reset
;
; Wall-clock opcodes used:
;   TMR_GET  -- reads milliseconds since VM start
;   ALARM_SET -- sets a wall-clock alarm that writes to RAM when it fires
;   ALARM_CLR -- cancels a pending alarm
;
; RAM Layout:
;   0x4000 = target_ms (absolute wall-clock target, written by alarm setup)
;   0x4004 = running flag (0=stopped, 1=running)
;   0x4008 = alarm fired flag (0=no, 1=yes)
;   0x400C = countdown seconds (user-set value)
;   0x4010 = start_ms (wall-clock time when countdown started)
;   0x4014 = alarm slot (returned by ALARM_SET)
;   0x5000 = text buffer

#define TARGET_MS   0x4000
#define RUNNING     0x4004
#define ALARM_FIRED 0x4008
#define CD_SECONDS  0x400C
#define START_MS    0x4010
#define ALARM_SLOT  0x4014
#define TXT_BUF     0x5000
#define ALARM_FLAG  0x4018

; ── INIT ──────────────────────────────────────────
    LDI r13, 1
    LDI r2, 0

    ; Default 10 seconds
    LDI r20, CD_SECONDS
    LDI r11, 10
    STORE r20, r11

    ; Not running
    LDI r20, RUNNING
    STORE r20, r2

    ; Not alarmed
    LDI r20, ALARM_FIRED
    STORE r20, r2

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r13, 1

    ; Read keyboard
    IKEY r3

    ; Check for digit keys 1-9 to set seconds
    CMPI r3, 49         ; '1'
    BLT r4, not_digit
    CMPI r3, 57         ; '9'
    BGE r4, not_digit

    ; Set countdown seconds = key - 48
    SUBI r3, 48
    LDI r20, CD_SECONDS
    STORE r20, r3

    ; Cancel any existing alarm
    LDI r20, ALARM_SLOT
    LOAD r12, r20
    CMPI r12, 0xFFFFFFFF  ; no alarm set
    JZ r4, digit_done
    ALARM_CLR r12
digit_done:
    ; Clear alarm slot
    LDI r2, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r2

    ; Reset state
    LDI r2, 0
    LDI r20, RUNNING
    STORE r20, r2
    LDI r20, ALARM_FIRED
    STORE r20, r2

    JMP main_loop

not_digit:
    ; Space (32) = start countdown
    CMPI r3, 32
    JNZ r4, not_space

    ; Don't start if already running or alarmed
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 1
    JZ r4, main_loop

    LDI r20, ALARM_FIRED
    LOAD r12, r20
    CMPI r12, 1
    JZ r4, main_loop

    ; Record start time using TMR_GET
    TMR_GET r7
    LDI r20, START_MS
    STORE r20, r7

    ; Set alarm for N seconds from now
    ; ALARM_SET delay_reg, addr_reg, value_reg
    ; We store the flag at ALARM_FLAG address
    LDI r20, CD_SECONDS
    LOAD r1, r20        ; countdown seconds
    LDI r5, 1000
    MUL r1, r5         ; convert to milliseconds
    LDI r5, ALARM_FLAG  ; RAM address to write when alarm fires
    LDI r8, 1           ; value to write (1 = fired)
    ALARM_SET r1, r5, r8

    ; Save alarm slot
    LDI r20, ALARM_SLOT
    STORE r20, r4        ; r4 = slot index from ALARM_SET

    ; Mark running
    LDI r2, 1
    LDI r20, RUNNING
    STORE r20, r2

    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r3, 82
    JNZ r4, not_reset

    ; Cancel alarm if one is active
    LDI r20, ALARM_SLOT
    LOAD r12, r20
    CMPI r12, 0xFFFFFFFF
    JZ r4, reset_no_alarm
    ALARM_CLR r12

reset_no_alarm:
    LDI r2, 0
    LDI r20, RUNNING
    STORE r20, r2
    LDI r20, ALARM_FIRED
    STORE r20, r2
    LDI r20, ALARM_FLAG
    STORE r20, r2
    LDI r2, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r2

    JMP main_loop

not_reset:
    ; Check if alarm has fired (wall-clock wrote to RAM)
    LDI r20, ALARM_FLAG
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, check_running

    ; Alarm fired! Stop and signal
    LDI r2, 0
    LDI r20, RUNNING
    STORE r20, r2
    LDI r2, 1
    LDI r20, ALARM_FIRED
    STORE r20, r2

    ; Play alarm beep (880Hz, 500ms)
    LDI r7, 880
    LDI r1, 500
    BEEP r7, r1

    JMP do_render

check_running:
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, do_render

    ; Update display: compute remaining = target - (now - start)
    ; remaining_ms = (cd_seconds * 1000) - (now - start_ms)
    TMR_GET r7
    LDI r20, START_MS
    LOAD r1, r20
    SUB r7, r1         ; elapsed since start
    LDI r20, CD_SECONDS
    LOAD r1, r20
    LDI r5, 1000
    MUL r1, r5         ; total ms
    SUB r1, r7         ; remaining ms
    LDI r20, TARGET_MS
    STORE r20, r1       ; store remaining for display

do_render:
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r13, 1

    ; Background
    LDI r2, 0x0A1628
    FILL r2

    ; Title bar
    LDI r2, 0x162840
    LDI r11, 0
    LDI r15, 0
    LDI r3, 256
    LDI r12, 24
    RECTF r11, r15, r3, r12, r2

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "WALL-CLOCK TIMER"
    LDI r11, 70
    LDI r15, 6
    LDI r20, TXT_BUF
    TEXT r11, r15, r20

    ; Main display panel
    LDI r2, 0x0A0A16
    LDI r11, 20
    LDI r15, 40
    LDI r3, 216
    LDI r12, 80
    RECTF r11, r15, r3, r12, r2

    ; Compute remaining seconds for display
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, show_static_time

    ; Running: show computed remaining from wall-clock
    LDI r20, TARGET_MS
    LOAD r7, r20
    LDI r1, 1000
    MOV r5, r7
    DIV r5, r1         ; remaining whole seconds

    ; Clamp to 0 (shouldn't go negative if alarm works, but safety)
    CMPI r5, 0
    BGE r4, have_remain
    LDI r5, 0
have_remain:
    MOV r10, r5         ; seconds for display
    JMP build_display

show_static_time:
    ; Not running: show configured seconds
    LDI r20, CD_SECONDS
    LOAD r10, r20

build_display:
    ; Build "XXs" string
    LDI r20, TXT_BUF
    MOV r5, r10
    CALL fmt_2digit
    LDI r2, 0x73         ; 's'
    STORE r20, r2
    ADDI r20, 1
    LDI r2, 0
    STORE r20, r2

    ; Draw time - color depends on state
    LDI r20, ALARM_FIRED
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, not_alarmed

    ; Flashing red when alarm
    TMR_GET r7
    LDI r1, 500
    MOD r7, r1
    CMPI r7, 250
    BGE r4, alarm_dark
    LDI r3, 0xFF2222
    JMP draw_timer
alarm_dark:
    LDI r3, 0x881111
    JMP draw_timer

not_alarmed:
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, timer_paused
    LDI r3, 0x00FF44     ; green when running
    JMP draw_timer
timer_paused:
    LDI r3, 0xAAAAAA     ; gray when paused

draw_timer:
    LDI r11, 75
    LDI r15, 65
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3

    ; Show wall-clock ms readout (proves TMR_GET is real)
    TMR_GET r7
    LDI r20, TXT_BUF
    STRO r20, "TMR_GET: "
    ADDI r20, 9
    CALL fmt_4hex
    LDI r2, 0x6D         ; 'm'
    STORE r20, r2
    ADDI r20, 1
    LDI r2, 0x73         ; 's'
    STORE r20, r2
    ADDI r20, 1
    LDI r2, 0
    STORE r20, r2
    LDI r11, 20
    LDI r15, 120
    LDI r3, 0x556677
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3

    ; Status panel
    LDI r2, 0x0D0D1A
    LDI r11, 20
    LDI r15, 140
    LDI r3, 216
    LDI r12, 40
    RECTF r11, r15, r3, r12, r2

    ; Show state
    LDI r20, ALARM_FIRED
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, show_running_state

    LDI r20, TXT_BUF
    STRO r20, "ALARM! Time is up!"
    LDI r11, 50
    LDI r15, 150
    LDI r3, 0xFF4444
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3
    JMP status_done

show_running_state:
    LDI r20, RUNNING
    LOAD r12, r20
    CMPI r12, 1
    JNZ r4, show_paused_state

    LDI r20, TXT_BUF
    STRO r20, "Counting (wall-clock)"
    LDI r11, 45
    LDI r15, 150
    LDI r3, 0x44FF44
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3
    JMP status_done

show_paused_state:
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 then Space"
    LDI r11, 45
    LDI r15, 150
    LDI r3, 0x888888
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3

status_done:
    ; Bottom info bar
    LDI r2, 0x080818
    LDI r11, 0
    LDI r15, 220
    LDI r3, 256
    LDI r12, 36
    RECTF r11, r15, r3, r12, r2

    LDI r20, TXT_BUF
    STRO r20, "1-9:secs Space:start R:reset"
    LDI r11, 18
    LDI r15, 228
    LDI r3, 0x666666
    LDI r20, TXT_BUF
    DRAWTEXT r11, r15, r20, r3, r3

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r5 (0-99) as 2 decimal chars at r20, advances r20
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

; ── FMT 4 HEX ─────────────────────────────────────
; Formats r7 as 4 hex chars at r20, advances r20
fmt_4hex:
    PUSH r31
    LDI r21, 12
hex_loop:
    MOV r22, r7
    SHR r22, r21
    ANDI r22, 0x0F
    CMPI r22, 10
    BLT r4, hex_digit
    ADDI r22, 0x37         ; 'A' - 10
    JMP hex_store
hex_digit:
    ADDI r22, 0x30         ; '0'
hex_store:
    STORE r20, r22
    ADDI r20, 1
    SUBI r21, 4
    CMPI r21, 0
    BGE r4, hex_loop
    POP r31
    RET
