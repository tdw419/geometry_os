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
    LDI r1, 1
    LDI r6, 0

    ; Default 10 seconds
    LDI r20, CD_SECONDS
    LDI r9, 10
    STORE r20, r9

    ; Not running
    LDI r20, RUNNING
    STORE r20, r6

    ; Not alarmed
    LDI r20, ALARM_FIRED
    STORE r20, r6

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r1, 1

    ; Read keyboard
    IKEY r2

    ; Check for digit keys 1-9 to set seconds
    CMPI r2, 49         ; '1'
    BLT r7, not_digit
    CMPI r2, 57         ; '9'
    BGE r7, not_digit

    ; Set countdown seconds = key - 48
    SUBI r2, 48
    LDI r20, CD_SECONDS
    STORE r20, r2

    ; Cancel any existing alarm
    LDI r20, ALARM_SLOT
    LOAD r11, r20
    CMPI r11, 0xFFFFFFFF  ; no alarm set
    JZ r7, digit_done
    ALARM_CLR r11
digit_done:
    ; Clear alarm slot
    LDI r6, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r6

    ; Reset state
    LDI r6, 0
    LDI r20, RUNNING
    STORE r20, r6
    LDI r20, ALARM_FIRED
    STORE r20, r6

    JMP main_loop

not_digit:
    ; Space (32) = start countdown
    CMPI r2, 32
    JNZ r7, not_space

    ; Don't start if already running or alarmed
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 1
    JZ r7, main_loop

    LDI r20, ALARM_FIRED
    LOAD r11, r20
    CMPI r11, 1
    JZ r7, main_loop

    ; Record start time using TMR_GET
    TMR_GET r10
    LDI r20, START_MS
    STORE r20, r10

    ; Set alarm for N seconds from now
    ; ALARM_SET delay_reg, addr_reg, value_reg
    ; We store the flag at ALARM_FLAG address
    LDI r20, CD_SECONDS
    LOAD r12, r20        ; countdown seconds
    LDI r3, 1000
    MUL r12, r3         ; convert to milliseconds
    LDI r3, ALARM_FLAG  ; RAM address to write when alarm fires
    LDI r4, 1           ; value to write (1 = fired)
    ALARM_SET r12, r3, r4

    ; Save alarm slot
    LDI r20, ALARM_SLOT
    STORE r20, r7        ; r7 = slot index from ALARM_SET

    ; Mark running
    LDI r6, 1
    LDI r20, RUNNING
    STORE r20, r6

    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r2, 82
    JNZ r7, not_reset

    ; Cancel alarm if one is active
    LDI r20, ALARM_SLOT
    LOAD r11, r20
    CMPI r11, 0xFFFFFFFF
    JZ r7, reset_no_alarm
    ALARM_CLR r11

reset_no_alarm:
    LDI r6, 0
    LDI r20, RUNNING
    STORE r20, r6
    LDI r20, ALARM_FIRED
    STORE r20, r6
    LDI r20, ALARM_FLAG
    STORE r20, r6
    LDI r6, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r6

    JMP main_loop

not_reset:
    ; Check if alarm has fired (wall-clock wrote to RAM)
    LDI r20, ALARM_FLAG
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, check_running

    ; Alarm fired! Stop and signal
    LDI r6, 0
    LDI r20, RUNNING
    STORE r20, r6
    LDI r6, 1
    LDI r20, ALARM_FIRED
    STORE r20, r6

    ; Play alarm beep (880Hz, 500ms)
    LDI r10, 880
    LDI r12, 500
    BEEP r10, r12

    JMP do_render

check_running:
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, do_render

    ; Update display: compute remaining = target - (now - start)
    ; remaining_ms = (cd_seconds * 1000) - (now - start_ms)
    TMR_GET r10
    LDI r20, START_MS
    LOAD r12, r20
    SUB r10, r12         ; elapsed since start
    LDI r20, CD_SECONDS
    LOAD r12, r20
    LDI r3, 1000
    MUL r12, r3         ; total ms
    SUB r12, r10         ; remaining ms
    LDI r20, TARGET_MS
    STORE r20, r12       ; store remaining for display

do_render:
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r1, 1

    ; Background
    LDI r6, 0x0A1628
    FILL r6

    ; Title bar
    LDI r6, 0x162840
    LDI r9, 0
    LDI r8, 0
    LDI r2, 256
    LDI r11, 24
    RECTF r9, r8, r2, r11, r6

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "WALL-CLOCK TIMER"
    LDI r9, 70
    LDI r8, 6
    LDI r20, TXT_BUF
    TEXT r9, r8, r20

    ; Main display panel
    LDI r6, 0x0A0A16
    LDI r9, 20
    LDI r8, 40
    LDI r2, 216
    LDI r11, 80
    RECTF r9, r8, r2, r11, r6

    ; Compute remaining seconds for display
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, show_static_time

    ; Running: show computed remaining from wall-clock
    LDI r20, TARGET_MS
    LOAD r10, r20
    LDI r12, 1000
    MOV r3, r10
    DIV r3, r12         ; remaining whole seconds

    ; Clamp to 0 (shouldn't go negative if alarm works, but safety)
    CMPI r3, 0
    BGE r7, have_remain
    LDI r3, 0
have_remain:
    MOV r0, r3         ; seconds for display
    JMP build_display

show_static_time:
    ; Not running: show configured seconds
    LDI r20, CD_SECONDS
    LOAD r0, r20

build_display:
    ; Build "XXs" string
    LDI r20, TXT_BUF
    MOV r3, r0
    CALL fmt_2digit
    LDI r6, 0x73         ; 's'
    STORE r20, r6
    ADDI r20, 1
    LDI r6, 0
    STORE r20, r6

    ; Draw time - color depends on state
    LDI r20, ALARM_FIRED
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, not_alarmed

    ; Flashing red when alarm
    TMR_GET r10
    LDI r12, 500
    MOD r10, r12
    CMPI r10, 250
    BGE r7, alarm_dark
    LDI r2, 0xFF2222
    JMP draw_timer
alarm_dark:
    LDI r2, 0x881111
    JMP draw_timer

not_alarmed:
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, timer_paused
    LDI r2, 0x00FF44     ; green when running
    JMP draw_timer
timer_paused:
    LDI r2, 0xAAAAAA     ; gray when paused

draw_timer:
    LDI r9, 75
    LDI r8, 65
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2

    ; Show wall-clock ms readout (proves TMR_GET is real)
    TMR_GET r10
    LDI r20, TXT_BUF
    STRO r20, "TMR_GET: "
    ADDI r20, 9
    CALL fmt_4hex
    LDI r6, 0x6D         ; 'm'
    STORE r20, r6
    ADDI r20, 1
    LDI r6, 0x73         ; 's'
    STORE r20, r6
    ADDI r20, 1
    LDI r6, 0
    STORE r20, r6
    LDI r9, 20
    LDI r8, 120
    LDI r2, 0x556677
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2

    ; Status panel
    LDI r6, 0x0D0D1A
    LDI r9, 20
    LDI r8, 140
    LDI r2, 216
    LDI r11, 40
    RECTF r9, r8, r2, r11, r6

    ; Show state
    LDI r20, ALARM_FIRED
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, show_running_state

    LDI r20, TXT_BUF
    STRO r20, "ALARM! Time is up!"
    LDI r9, 50
    LDI r8, 150
    LDI r2, 0xFF4444
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2
    JMP status_done

show_running_state:
    LDI r20, RUNNING
    LOAD r11, r20
    CMPI r11, 1
    JNZ r7, show_paused_state

    LDI r20, TXT_BUF
    STRO r20, "Counting (wall-clock)"
    LDI r9, 45
    LDI r8, 150
    LDI r2, 0x44FF44
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2
    JMP status_done

show_paused_state:
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 then Space"
    LDI r9, 45
    LDI r8, 150
    LDI r2, 0x888888
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2

status_done:
    ; Bottom info bar
    LDI r6, 0x080818
    LDI r9, 0
    LDI r8, 220
    LDI r2, 256
    LDI r11, 36
    RECTF r9, r8, r2, r11, r6

    LDI r20, TXT_BUF
    STRO r20, "1-9:secs Space:start R:reset"
    LDI r9, 18
    LDI r8, 228
    LDI r2, 0x666666
    LDI r20, TXT_BUF
    DRAWTEXT r9, r8, r20, r2, r2

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r3 (0-99) as 2 decimal chars at r20, advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r3
    DIV r22, r21
    MOV r23, r3
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
; Formats r10 as 4 hex chars at r20, advances r20
fmt_4hex:
    PUSH r31
    LDI r21, 12
hex_loop:
    MOV r22, r10
    SHR r22, r21
    ANDI r22, 0x0F
    CMPI r22, 10
    BLT r7, hex_digit
    ADDI r22, 0x37         ; 'A' - 10
    JMP hex_store
hex_digit:
    ADDI r22, 0x30         ; '0'
hex_store:
    STORE r20, r22
    ADDI r20, 1
    SUBI r21, 4
    CMPI r21, 0
    BGE r7, hex_loop
    POP r31
    RET
