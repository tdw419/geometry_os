; DESCRIPTION: Display a object using color colored at the screen.

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
    LDI r7, 1
    LDI r14, 0

    ; Default 10 seconds
    LDI r20, CD_SECONDS
    LDI r4, 10
    STORE r20, r4

    ; Not running
    LDI r20, RUNNING
    STORE r20, r14

    ; Not alarmed
    LDI r20, ALARM_FIRED
    STORE r20, r14

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r7, 1

    ; Read keyboard
    IKEY r12

    ; Check for digit keys 1-9 to set seconds
    CMPI r12, 49         ; '1'
    BLT r6, not_digit
    CMPI r12, 57         ; '9'
    BGE r6, not_digit

    ; Set countdown seconds = key - 48
    SUBI r12, 48
    LDI r20, CD_SECONDS
    STORE r20, r12

    ; Cancel any existing alarm
    LDI r20, ALARM_SLOT
    LOAD r8, r20
    CMPI r8, 0xFFFFFFFF  ; no alarm set
    JZ r6, digit_done
    ALARM_CLR r8
digit_done:
    ; Clear alarm slot
    LDI r14, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r14

    ; Reset state
    LDI r14, 0
    LDI r20, RUNNING
    STORE r20, r14
    LDI r20, ALARM_FIRED
    STORE r20, r14

    JMP main_loop

not_digit:
    ; Space (32) = start countdown
    CMPI r12, 32
    JNZ r6, not_space

    ; Don't start if already running or alarmed
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 1
    JZ r6, main_loop

    LDI r20, ALARM_FIRED
    LOAD r8, r20
    CMPI r8, 1
    JZ r6, main_loop

    ; Record start time using TMR_GET
    TMR_GET r11
    LDI r20, START_MS
    STORE r20, r11

    ; Set alarm for N seconds from now
    ; ALARM_SET delay_reg, addr_reg, value_reg
    ; We store the flag at ALARM_FLAG address
    LDI r20, CD_SECONDS
    LOAD r1, r20        ; countdown seconds
    LDI r3, 1000
    MUL r1, r3         ; convert to milliseconds
    LDI r3, ALARM_FLAG  ; RAM address to write when alarm fires
    LDI r5, 1           ; value to write (1 = fired)
    ALARM_SET r1, r3, r5

    ; Save alarm slot
    LDI r20, ALARM_SLOT
    STORE r20, r6        ; r6 = slot index from ALARM_SET

    ; Mark running
    LDI r14, 1
    LDI r20, RUNNING
    STORE r20, r14

    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r12, 82
    JNZ r6, not_reset

    ; Cancel alarm if one is active
    LDI r20, ALARM_SLOT
    LOAD r8, r20
    CMPI r8, 0xFFFFFFFF
    JZ r6, reset_no_alarm
    ALARM_CLR r8

reset_no_alarm:
    LDI r14, 0
    LDI r20, RUNNING
    STORE r20, r14
    LDI r20, ALARM_FIRED
    STORE r20, r14
    LDI r20, ALARM_FLAG
    STORE r20, r14
    LDI r14, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r14

    JMP main_loop

not_reset:
    ; Check if alarm has fired (wall-clock wrote to RAM)
    LDI r20, ALARM_FLAG
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, check_running

    ; Alarm fired! Stop and signal
    LDI r14, 0
    LDI r20, RUNNING
    STORE r20, r14
    LDI r14, 1
    LDI r20, ALARM_FIRED
    STORE r20, r14

    ; Play alarm beep (880Hz, 500ms)
    LDI r11, 880
    LDI r1, 500
    BEEP r11, r1

    JMP do_render

check_running:
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, do_render

    ; Update display: compute remaining = target - (now - start)
    ; remaining_ms = (cd_seconds * 1000) - (now - start_ms)
    TMR_GET r11
    LDI r20, START_MS
    LOAD r1, r20
    SUB r11, r1         ; elapsed since start
    LDI r20, CD_SECONDS
    LOAD r1, r20
    LDI r3, 1000
    MUL r1, r3         ; total ms
    SUB r1, r11         ; remaining ms
    LDI r20, TARGET_MS
    STORE r20, r1       ; store remaining for display

do_render:
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r7, 1

    ; Background
    LDI r14, 0x0A1628
    FILL r14

    ; Title bar
    LDI r14, 0x162840
    LDI r4, 0
    LDI r10, 0
    LDI r12, 256
    LDI r8, 24
    RECTF r4, r10, r12, r8, r14

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "WALL-CLOCK TIMER"
    LDI r4, 70
    LDI r10, 6
    LDI r20, TXT_BUF
    TEXT r4, r10, r20

    ; Main display panel
    LDI r14, 0x0A0A16
    LDI r4, 20
    LDI r10, 40
    LDI r12, 216
    LDI r8, 80
    RECTF r4, r10, r12, r8, r14

    ; Compute remaining seconds for display
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, show_static_time

    ; Running: show computed remaining from wall-clock
    LDI r20, TARGET_MS
    LOAD r11, r20
    LDI r1, 1000
    MOV r3, r11
    DIV r3, r1         ; remaining whole seconds

    ; Clamp to 0 (shouldn't go negative if alarm works, but safety)
    CMPI r3, 0
    BGE r6, have_remain
    LDI r3, 0
have_remain:
    MOV r13, r3         ; seconds for display
    JMP build_display

show_static_time:
    ; Not running: show configured seconds
    LDI r20, CD_SECONDS
    LOAD r13, r20

build_display:
    ; Build "XXs" string
    LDI r20, TXT_BUF
    MOV r3, r13
    CALL fmt_2digit
    LDI r14, 0x73         ; 's'
    STORE r20, r14
    ADDI r20, 1
    LDI r14, 0
    STORE r20, r14

    ; Draw time - color depends on state
    LDI r20, ALARM_FIRED
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, not_alarmed

    ; Flashing red when alarm
    TMR_GET r11
    LDI r1, 500
    MOD r11, r1
    CMPI r11, 250
    BGE r6, alarm_dark
    LDI r12, 0xFF2222
    JMP draw_timer
alarm_dark:
    LDI r12, 0x881111
    JMP draw_timer

not_alarmed:
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, timer_paused
    LDI r12, 0x00FF44     ; green when running
    JMP draw_timer
timer_paused:
    LDI r12, 0xAAAAAA     ; gray when paused

draw_timer:
    LDI r4, 75
    LDI r10, 65
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12

    ; Show wall-clock ms readout (proves TMR_GET is real)
    TMR_GET r11
    LDI r20, TXT_BUF
    STRO r20, "TMR_GET: "
    ADDI r20, 9
    CALL fmt_4hex
    LDI r14, 0x6D         ; 'm'
    STORE r20, r14
    ADDI r20, 1
    LDI r14, 0x73         ; 's'
    STORE r20, r14
    ADDI r20, 1
    LDI r14, 0
    STORE r20, r14
    LDI r4, 20
    LDI r10, 120
    LDI r12, 0x556677
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12

    ; Status panel
    LDI r14, 0x0D0D1A
    LDI r4, 20
    LDI r10, 140
    LDI r12, 216
    LDI r8, 40
    RECTF r4, r10, r12, r8, r14

    ; Show state
    LDI r20, ALARM_FIRED
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, show_running_state

    LDI r20, TXT_BUF
    STRO r20, "ALARM! Time is up!"
    LDI r4, 50
    LDI r10, 150
    LDI r12, 0xFF4444
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12
    JMP status_done

show_running_state:
    LDI r20, RUNNING
    LOAD r8, r20
    CMPI r8, 1
    JNZ r6, show_paused_state

    LDI r20, TXT_BUF
    STRO r20, "Counting (wall-clock)"
    LDI r4, 45
    LDI r10, 150
    LDI r12, 0x44FF44
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12
    JMP status_done

show_paused_state:
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 then Space"
    LDI r4, 45
    LDI r10, 150
    LDI r12, 0x888888
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12

status_done:
    ; Bottom info bar
    LDI r14, 0x080818
    LDI r4, 0
    LDI r10, 220
    LDI r12, 256
    LDI r8, 36
    RECTF r4, r10, r12, r8, r14

    LDI r20, TXT_BUF
    STRO r20, "1-9:secs Space:start R:reset"
    LDI r4, 18
    LDI r10, 228
    LDI r12, 0x666666
    LDI r20, TXT_BUF
    DRAWTEXT r4, r10, r20, r12, r12

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
; Formats r11 as 4 hex chars at r20, advances r20
fmt_4hex:
    PUSH r31
    LDI r21, 12
hex_loop:
    MOV r22, r11
    SHR r22, r21
    ANDI r22, 0x0F
    CMPI r22, 10
    BLT r6, hex_digit
    ADDI r22, 0x37         ; 'A' - 10
    JMP hex_store
hex_digit:
    ADDI r22, 0x30         ; '0'
hex_store:
    STORE r20, r22
    ADDI r20, 1
    SUBI r21, 4
    CMPI r21, 0
    BGE r6, hex_loop
    POP r31
    RET
