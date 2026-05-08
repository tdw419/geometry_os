; DESCRIPTION: This GeOS assembly code implements a stopwatch application that tracks elapsed time and lap times. It uses frame timing to manage seconds and centiseconds, handles keyboard inputs for starting/stopping, recording laps, and resetting, and renders the display with text and rectangles using defined RAM addresses for state management.

; stopwatch.asm -- Stopwatch with Lap Times for Geometry OS
;
; Phase 75: Time management app. Proves FRAME timing, TEXT/DRAWTEXT,
;           RECTF rendering, keyboard input via IKEY, RAM state.
;
; Controls:
;   Space = Start/Stop
;   L     = Lap (record lap time, stores last 10)
;   R     = Reset (clear elapsed time and laps)
;
; Timing:
;   60 frames = 1 second
;   Elapsed stored in centiseconds (each frame = ~1.67 cs)
;   Display: MM:SS.CC (minutes, seconds, centiseconds)
;
; RAM Layout:
;   0x4000 = running flag (0=stopped, 1=running)
;   0x4004 = elapsed centiseconds (u32)
;   0x4008 = frame accumulator (0-59, resets at 60)
;   0x400C = lap count (0-10)
;   0x4010 = last lap centiseconds
;   0x4100 = lap times array (10 x u32)
;   0x5000 = text buffer for display (32 chars)
;
; NOTE: No colons in comments (assembler pitfall)

#define RUNNING      0x4000
#define ELAPSED_CS   0x4004
#define FRAME_ACC    0x4008
#define LAP_COUNT    0x400C
#define LAST_LAP     0x4010
#define LAP_BASE     0x4100
#define TXT_BUF      0x5000
#define TICKS_ADDR   0xFFE

; ── INIT ──────────────────────────────────────────
    LDI r9, 1
    LDI r2, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r2
    LDI r20, ELAPSED_CS
    STORE r20, r2
    LDI r20, FRAME_ACC
    STORE r20, r2
    LDI r20, LAP_COUNT
    STORE r20, r2
    LDI r20, LAST_LAP
    STORE r20, r2

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r9, 1

    ; Read keyboard
    IKEY r0

    ; Space (32) = toggle running
    CMPI r0, 32
    JNZ r6, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r0, 76
    JNZ r6, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r0, 82
    JNZ r6, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r10, r20
    CMPI r10, 0
    JZ r6, skip_update
    CALL update_time

skip_update:
    ; Render display
    CALL render

    FRAME
    JMP main_loop

; ── TOGGLE RUNNING ────────────────────────────────
toggle_running:
    PUSH r31
    LDI r20, RUNNING
    LOAD r10, r20
    CMPI r10, 0
    JNZ r6, was_running
    LDI r10, 1
    STORE r20, r10
    JMP toggle_done
was_running:
    LDI r10, 0
    STORE r20, r10
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r9, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r10, r20
    ADDI r10, 1
    STORE r20, r10

    ; Check if 60 frames passed (1 second)
    CMPI r10, 60
    BLT r6, update_done

    ; Reset frame accumulator
    LDI r10, 0
    STORE r20, r10

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r10, r20
    ADDI r10, 100
    STORE r20, r10

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r9, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r10, r20
    CMPI r10, 10
    BGE r6, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r3, r20
    LDI r20, LAST_LAP
    LOAD r13, r20
    SUB r3, r13         ; r3 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r10        ; r21 = LAP_BASE + lap_count
    STORE r21, r3

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r3, r20
    LDI r20, LAST_LAP
    STORE r20, r3

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r10, r20
    ADDI r10, 1
    STORE r20, r10

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r2, 0

    LDI r20, RUNNING
    STORE r20, r2
    LDI r20, ELAPSED_CS
    STORE r20, r2
    LDI r20, FRAME_ACC
    STORE r20, r2
    LDI r20, LAP_COUNT
    STORE r20, r2
    LDI r20, LAST_LAP
    STORE r20, r2

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r9, 1

    ; Background
    LDI r2, 0x0D1B2A
    FILL r2

    ; Title bar
    LDI r2, 0x1B3A4B
    LDI r12, 0
    LDI r11, 0
    LDI r0, 256
    LDI r10, 24
    RECTF r12, r11, r0, r10, r2

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r12, 80
    LDI r11, 6
    LDI r20, TXT_BUF
    TEXT r12, r11, r20

    ; Main time panel
    LDI r2, 0x060612
    LDI r12, 20
    LDI r11, 35
    LDI r0, 216
    LDI r10, 70
    RECTF r12, r11, r0, r10, r2

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r7, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r8, 6000
    MOV r5, r7
    DIV r5, r8

    ; Remaining = elapsed % 6000
    MOV r4, r7
    MOD r4, r8

    ; Seconds = remaining / 100
    LDI r14, 100
    MOV r1, r4
    DIV r1, r14

    ; Centiseconds = remaining % 100
    MOV r16, r4
    MOD r16, r14

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r5, r5        ; minutes
    CALL fmt_2digit

    LDI r2, 0x3A       ; ':'
    STORE r20, r2
    ADDI r20, 1

    MOV r5, r1        ; seconds
    CALL fmt_2digit

    LDI r2, 0x2E       ; '.'
    STORE r20, r2
    ADDI r20, 1

    MOV r5, r16        ; centiseconds
    CALL fmt_2digit

    LDI r2, 0
    STORE r20, r2

    ; Draw time (white text)
    LDI r12, 55
    LDI r11, 58
    LDI r20, TXT_BUF
    TEXT r12, r11, r20

    ; Status panel
    LDI r2, 0x0D0D1A
    LDI r12, 20
    LDI r11, 115
    LDI r0, 216
    LDI r10, 45
    RECTF r12, r11, r0, r10, r2

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r10, r20
    CMPI r10, 0
    JNZ r6, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r12, 80
    LDI r11, 128
    LDI r0, 0xFF4444
    DRAWTEXT r12, r11, r20, r0, r0
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r12, 80
    LDI r11, 128
    LDI r0, 0x44FF44
    DRAWTEXT r12, r11, r20, r0, r0

show_status_done:
    ; Lap panel
    LDI r2, 0x101828
    LDI r12, 20
    LDI r11, 170
    LDI r0, 216
    LDI r10, 50
    RECTF r12, r11, r0, r10, r2

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r5, r21
    CALL fmt_2digit
    LDI r2, 0
    STORE r20, r2

    LDI r12, 80
    LDI r11, 185
    LDI r20, TXT_BUF
    TEXT r12, r11, r20

    ; Bottom bar
    LDI r2, 0x0A0A1A
    LDI r12, 0
    LDI r11, 240
    LDI r0, 256
    LDI r10, 16
    RECTF r12, r11, r0, r10, r2

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r5 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r5
    DIV r22, r21       ; tens
    MOV r23, r5
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
