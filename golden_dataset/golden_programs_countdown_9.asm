; DESCRIPTION: Render a colored object at the screen.

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
    LDI r5, 1
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
    LDI r5, 1

    ; Read keyboard
    IKEY r7

    ; Check for digit keys 1-9 to set seconds
    CMPI r7, 49         ; '1'
    BLT r14, not_digit
    CMPI r7, 57         ; '9'
    BGE r14, not_digit

    ; Set countdown seconds = key - 48
    SUBI r7, 48
    LDI r20, CD_SECONDS
    STORE r20, r7

    ; Cancel any existing alarm
    LDI r20, ALARM_SLOT
    LOAD r9, r20
    CMPI r9, 0xFFFFFFFF  ; no alarm set
    JZ r14, digit_done
    ALARM_CLR r9
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
    CMPI r7, 32
    JNZ r14, not_space

    ; Don't start if already running or alarmed
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 1
    JZ r14, main_loop

    LDI r20, ALARM_FIRED
    LOAD r9, r20
    CMPI r9, 1
    JZ r14, main_loop

    ; Record start time using TMR_GET
    TMR_GET r13
    LDI r20, START_MS
    STORE r20, r13

    ; Set alarm for N seconds from now
    ; ALARM_SET delay_reg, addr_reg, value_reg
    ; We store the flag at ALARM_FLAG address
    LDI r20, CD_SECONDS
    LOAD r15, r20        ; countdown seconds
    LDI r6, 1000
    MUL r15, r6         ; convert to milliseconds
    LDI r6, ALARM_FLAG  ; RAM address to write when alarm fires
    LDI r1, 1           ; value to write (1 = fired)
    ALARM_SET r15, r6, r1

    ; Save alarm slot
    LDI r20, ALARM_SLOT
    STORE r20, r14        ; r14 = slot index from ALARM_SET

    ; Mark running
    LDI r2, 1
    LDI r20, RUNNING
    STORE r20, r2

    JMP main_loop

not_space:
    ; R (82) = reset
    CMPI r7, 82
    JNZ r14, not_reset

    ; Cancel alarm if one is active
    LDI r20, ALARM_SLOT
    LOAD r9, r20
    CMPI r9, 0xFFFFFFFF
    JZ r14, reset_no_alarm
    ALARM_CLR r9

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
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, check_running

    ; Alarm fired! Stop and signal
    LDI r2, 0
    LDI r20, RUNNING
    STORE r20, r2
    LDI r2, 1
    LDI r20, ALARM_FIRED
    STORE r20, r2

    ; Play alarm beep (880Hz, 500ms)
    LDI r13, 880
    LDI r15, 500
    BEEP r13, r15

    JMP do_render

check_running:
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, do_render

    ; Update display: compute remaining = target - (now - start)
    ; remaining_ms = (cd_seconds * 1000) - (now - start_ms)
    TMR_GET r13
    LDI r20, START_MS
    LOAD r15, r20
    SUB r13, r15         ; elapsed since start
    LDI r20, CD_SECONDS
    LOAD r15, r20
    LDI r6, 1000
    MUL r15, r6         ; total ms
    SUB r15, r13         ; remaining ms
    LDI r20, TARGET_MS
    STORE r20, r15       ; store remaining for display

do_render:
    CALL render

    FRAME
    JMP main_loop

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r5, 1

    ; Background
    LDI r2, 0x0A1628
    FILL r2

    ; Title bar
    LDI r2, 0x162840
    LDI r11, 0
    LDI r0, 0
    LDI r7, 256
    LDI r9, 24
    RECTF r11, r0, r7, r9, r2

    ; Title text
    LDI r20, TXT_BUF
    STRO r20, "WALL-CLOCK TIMER"
    LDI r11, 70
    LDI r0, 6
    LDI r20, TXT_BUF
    TEXT r11, r0, r20

    ; Main display panel
    LDI r2, 0x0A0A16
    LDI r11, 20
    LDI r0, 40
    LDI r7, 216
    LDI r9, 80
    RECTF r11, r0, r7, r9, r2

    ; Compute remaining seconds for display
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, show_static_time

    ; Running: show computed remaining from wall-clock
    LDI r20, TARGET_MS
    LOAD r13, r20
    LDI r15, 1000
    MOV r6, r13
    DIV r6, r15         ; remaining whole seconds

    ; Clamp to 0 (shouldn't go negative if alarm works, but safety)
    CMPI r6, 0
    BGE r14, have_remain
    LDI r6, 0
have_remain:
    MOV r8, r6         ; seconds for display
    JMP build_display

show_static_time:
    ; Not running: show configured seconds
    LDI r20, CD_SECONDS
    LOAD r8, r20

build_display:
    ; Build "XXs" string
    LDI r20, TXT_BUF
    MOV r6, r8
    CALL fmt_2digit
    LDI r2, 0x73         ; 's'
    STORE r20, r2
    ADDI r20, 1
    LDI r2, 0
    STORE r20, r2

    ; Draw time - color depends on state
    LDI r20, ALARM_FIRED
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, not_alarmed

    ; Flashing red when alarm
    TMR_GET r13
    LDI r15, 500
    MOD r13, r15
    CMPI r13, 250
    BGE r14, alarm_dark
    LDI r7, 0xFF2222
    JMP draw_timer
alarm_dark:
    LDI r7, 0x881111
    JMP draw_timer

not_alarmed:
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, timer_paused
    LDI r7, 0x00FF44     ; green when running
    JMP draw_timer
timer_paused:
    LDI r7, 0xAAAAAA     ; gray when paused

draw_timer:
    LDI r11, 75
    LDI r0, 65
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7

    ; Show wall-clock ms readout (proves TMR_GET is real)
    TMR_GET r13
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
    LDI r0, 120
    LDI r7, 0x556677
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7

    ; Status panel
    LDI r2, 0x0D0D1A
    LDI r11, 20
    LDI r0, 140
    LDI r7, 216
    LDI r9, 40
    RECTF r11, r0, r7, r9, r2

    ; Show state
    LDI r20, ALARM_FIRED
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, show_running_state

    LDI r20, TXT_BUF
    STRO r20, "ALARM! Time is up!"
    LDI r11, 50
    LDI r0, 150
    LDI r7, 0xFF4444
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7
    JMP status_done

show_running_state:
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 1
    JNZ r14, show_paused_state

    LDI r20, TXT_BUF
    STRO r20, "Counting (wall-clock)"
    LDI r11, 45
    LDI r0, 150
    LDI r7, 0x44FF44
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7
    JMP status_done

show_paused_state:
    LDI r20, TXT_BUF
    STRO r20, "Press 1-9 then Space"
    LDI r11, 45
    LDI r0, 150
    LDI r7, 0x888888
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7

status_done:
    ; Bottom info bar
    LDI r2, 0x080818
    LDI r11, 0
    LDI r0, 220
    LDI r7, 256
    LDI r9, 36
    RECTF r11, r0, r7, r9, r2

    LDI r20, TXT_BUF
    STRO r20, "1-9:secs Space:start R:reset"
    LDI r11, 18
    LDI r0, 228
    LDI r7, 0x666666
    LDI r20, TXT_BUF
    DRAWTEXT r11, r0, r20, r7, r7

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r6 (0-99) as 2 decimal chars at r20, advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r6
    DIV r22, r21
    MOV r23, r6
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
; Formats r13 as 4 hex chars at r20, advances r20
fmt_4hex:
    PUSH r31
    LDI r21, 12
hex_loop:
    MOV r22, r13
    SHR r22, r21
    ANDI r22, 0x0F
    CMPI r22, 10
    BLT r14, hex_digit
    ADDI r22, 0x37         ; 'A' - 10
    JMP hex_store
hex_digit:
    ADDI r22, 0x30         ; '0'
hex_store:
    STORE r20, r22
    ADDI r20, 1
    SUBI r21, 4
    CMPI r21, 0
    BGE r14, hex_loop
    POP r31
    RET
