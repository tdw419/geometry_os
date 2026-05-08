; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r15, 1
    LDI r7, 0

    ; Default 10 seconds
    LDI r20, CD_SECONDS
    LDI r3, 10
    STORE r20, r3

    ; Not running
    LDI r20, RUNNING
    STORE r20, r7

    ; Not alarmed
    LDI r20, ALARM_FIRED
    STORE r20, r7

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r15, 1

    ; Read keyboard
    IKEY r6

    ; Check for digit keys 1-9 to set seconds
    CMPI r6, 49         ; '1'
    BLT r4, not_digit
    CMPI r6, 57         ; '9'
    BGE r4, not_digit

    ; Set countdown seconds = key - 48
    SUBI r6, 48
    LDI r20, CD_SECONDS
    STORE r20, r6

    ; Cancel any existing alarm
    LDI r20, ALARM_SLOT
    LOAD r5, r20
    CMPI r5, 0xFFFFFFFF  ; no alarm set
    JZ r4, digit_done
    ALARM_CLR r5
digit_done:
    ; Clear alarm slot
    LDI r7, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r7

    ; Reset state
    LDI r7, 0
    LDI r20, RUNNING
    STORE r20, r7
    LDI r20, ALARM_FIRED
    STORE r20, r7

    JMP main_loop

not_digit:
    ; Space (32) = start countdown
    CMPI r6, 32
    JNZ r4, not_space

    ; Don't start if already running or alarmed
    LDI r20, RUNNING
    LOAD r5, r20
    CMPI r5, 1
    JZ r4, main_loop

    LDI r20, ALARM_FIRED
    LOAD r5, r20
    CMPI r5, 1
    JZ r4, main_loop

    ; Record start time using TMR_GET
    TMR_GET r14
    LDI r20, START_MS
    STORE r20, r14

    ; Set alarm for N seconds from now
    ; ALARM_SET delay_reg, addr_reg, value_reg
    ; We store the flag at ALARM_FLAG address
    LDI r20, CD_SECONDS
    LOAD r10, r20        ; countdown seconds
    LDI r13, 1000
    MUL r10, r13         ; convert to milliseconds
    LDI r13, ALARM_FLAG  ; RAM address to write when alarm fires
    LDI r9, 1           ; value to write (1 = fired)
    ALARM_SET r10, r13, r9

    ; Save alarm slot
    LDI r20, ALARM_SLOT
    STORE r20, r4        ; r4 = slot index from ALARM_SET

    ; Mark running
    LDI r7, 1
    LDI r20, RUNNING
    STORE r20, r7

    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r6, 82
    JNZ r4, not_reset

    ; Cancel alarm if one is active
    LDI r20, ALARM_SLOT
    LOAD r5, r20
    CMPI r5, 0xFFFFFFFF
    JZ r4, reset_no_alarm
    ALARM_CLR r5

reset_no_alarm:
    LDI r7, 0
    LDI r20, RUNNING
    STORE r20, r7
    LDI r20, ALARM_FIRED
    STORE r20, r7
    LDI r20, ALARM_FLAG
    STORE r20, r7
    LDI r7, 0xFFFFFFFF
    LDI r20, ALARM_SLOT
    STORE r20, r7

    JMP main_loop

not_reset:
    ; Check if alarm has fired (wall-clock wrote to RAM)
    LDI r20, ALARM_FLAG
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, check_running

    ; Alarm fired! Stop and signal
    LDI r7, 0
    LDI r20, RUNNING
    STORE r20, r7
    LDI r7, 1
    LDI r20, ALARM_FIRED
    STORE r20, r7

    ; Play alarm beep (880Hz, 500ms)
    LDI r14, 880
    LDI r10, 500
    BEEP r14, r10

    JMP do_render

check_running:
    LDI r20, RUNNING
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, do_render

    ; Update display: compute remaining = target - (now - start)
    ; remaining_ms = (cd_seconds * 1000) - (now - start_ms)
    TMR_GET r14
    LDI r20, START_MS
    LOAD r10, r20
    SUB r14, r10         ; elapsed since start
    LDI r20, CD_SECONDS
    LOAD r10, r20
    LDI r13, 1000
    MUL r10, r13         ; total ms
    SUB r10, r14         ; remaining ms
    LDI r20, TARGET_MS
    STORE r20, r10       ; store remaining for display

do_render:
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r15, 1

    ; Background
    LDI r7, 0x0A1628
    FILL r7

    ; Title bar
    LDI r7, 0x162840
    LDI r3, 0
    LDI r12, 0
    LDI r6, 256
    LDI r5, 24
    RECTF r3, r12, r6, r5, r7

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "WALL-CLOCK TIMER"
    LDI r3, 70
    LDI r12, 6
    LDI r20, TXT_BUF
    TEXT r3, r12, r20

    ; Main display panel
    LDI r7, 0x0A0A16
    LDI r3, 20
    LDI r12, 40
    LDI r6, 216
    LDI r5, 80
    RECTF r3, r12, r6, r5, r7

    ; Compute remaining seconds for display
    LDI r20, RUNNING
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, show_static_time

    ; Running: show computed remaining from wall-clock
    LDI r20, TARGET_MS
    LOAD r14, r20
    LDI r10, 1000
    MOV r13, r14
    DIV r13, r10         ; remaining whole seconds

    ; Clamp to 0 (shouldn't go negative if alarm works, but safety)
    CMPI r13, 0
    BGE r4, have_remain
    LDI r13, 0
have_remain:
    MOV r0, r13         ; seconds for display
    JMP build_display

show_static_time:
    ; Not running: show configured seconds
    LDI r20, CD_SECONDS
    LOAD r0, r20

build_display:
    ; Build "XXs" string
    LDI r20, TXT_BUF
    MOV r13, r0
    CALL fmt_2digit
    LDI r7, 0x73         ; 's'
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 0
    STORE r20, r7

    ; Draw time - color depends on state
    LDI r20, ALARM_FIRED
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, not_alarmed

    ; Flashing red when alarm
    TMR_GET r14
    LDI r10, 500
    MOD r14, r10
    CMPI r14, 250
    BGE r4, alarm_dark
    LDI r6, 0xFF2222
    JMP draw_timer
alarm_dark:
    LDI r6, 0x881111
    JMP draw_timer

not_alarmed:
    LDI r20, RUNNING
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, timer_paused
    LDI r6, 0x00FF44     ; green when running
    JMP draw_timer
timer_paused:
    LDI r6, 0xAAAAAA     ; gray when paused

draw_timer:
    LDI r3, 75
    LDI r12, 65
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6

    ; Show wall-clock ms readout (proves TMR_GET is real)
    TMR_GET r14
    LDI r20, TXT_BUF
    STRO r20, "TMR_GET: "
    ADDI r20, 9
    CALL fmt_4hex
    LDI r7, 0x6D         ; 'm'
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 0x73         ; 's'
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 0
    STORE r20, r7
    LDI r3, 20
    LDI r12, 120
    LDI r6, 0x556677
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6

    ; Status panel
    LDI r7, 0x0D0D1A
    LDI r3, 20
    LDI r12, 140
    LDI r6, 216
    LDI r5, 40
    RECTF r3, r12, r6, r5, r7

    ; Show state
    LDI r20, ALARM_FIRED
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, show_running_state

    LDI r20, TXT_BUF
    STRO r20, "ALARM! Time is up!"
    LDI r3, 50
    LDI r12, 150
    LDI r6, 0xFF4444
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6
    JMP status_done

show_running_state:
    LDI r20, RUNNING
    LOAD r5, r20
    CMPI r5, 1
    JNZ r4, show_paused_state

    LDI r20, TXT_BUF
    STRO r20, "Counting (wall-clock)"
    LDI r3, 45
    LDI r12, 150
    LDI r6, 0x44FF44
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6
    JMP status_done

show_paused_state:
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 then Space"
    LDI r3, 45
    LDI r12, 150
    LDI r6, 0x888888
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6

status_done:
    ; Bottom info bar
    LDI r7, 0x080818
    LDI r3, 0
    LDI r12, 220
    LDI r6, 256
    LDI r5, 36
    RECTF r3, r12, r6, r5, r7

    LDI r20, TXT_BUF
    STRO r20, "1-9:secs Space:start R:reset"
    LDI r3, 18
    LDI r12, 228
    LDI r6, 0x666666
    LDI r20, TXT_BUF
    DRAWTEXT r3, r12, r20, r6, r6

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r13 (0-99) as 2 decimal chars at r20, advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r13
    DIV r22, r21
    MOV r23, r13
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
; Formats r14 as 4 hex chars at r20, advances r20
fmt_4hex:
    PUSH r31
    LDI r21, 12
hex_loop:
    MOV r22, r14
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
