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
    LDI r11, 1
    LDI r8, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r8
    LDI r20, ELAPSED_CS
    STORE r20, r8
    LDI r20, FRAME_ACC
    STORE r20, r8
    LDI r20, LAP_COUNT
    STORE r20, r8
    LDI r20, LAST_LAP
    STORE r20, r8

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r11, 1

    ; Read keyboard
    IKEY r2

    ; Space (32) = toggle running
    CMPI r2, 32
    JNZ r12, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r2, 76
    JNZ r12, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r2, 82
    JNZ r12, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r0, r20
    CMPI r0, 0
    JZ r12, skip_update
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
    LOAD r0, r20
    CMPI r0, 0
    JNZ r12, was_running
    LDI r0, 1
    STORE r20, r0
    JMP toggle_done
was_running:
    LDI r0, 0
    STORE r20, r0
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r11, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r0, r20
    ADDI r0, 1
    STORE r20, r0

    ; Check if 60 frames passed (1 second)
    CMPI r0, 60
    BLT r12, update_done

    ; Reset frame accumulator
    LDI r0, 0
    STORE r20, r0

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r0, r20
    ADDI r0, 100
    STORE r20, r0

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r11, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r0, r20
    CMPI r0, 10
    BGE r12, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r5, r20
    LDI r20, LAST_LAP
    LOAD r1, r20
    SUB r5, r1         ; r5 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r0        ; r21 = LAP_BASE + lap_count
    STORE r21, r5

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r5, r20
    LDI r20, LAST_LAP
    STORE r20, r5

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r0, r20
    ADDI r0, 1
    STORE r20, r0

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r8, 0

    LDI r20, RUNNING
    STORE r20, r8
    LDI r20, ELAPSED_CS
    STORE r20, r8
    LDI r20, FRAME_ACC
    STORE r20, r8
    LDI r20, LAP_COUNT
    STORE r20, r8
    LDI r20, LAST_LAP
    STORE r20, r8

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r11, 1

    ; Background
    LDI r8, 0x0D1B2A
    FILL r8

    ; Title bar
    LDI r8, 0x1B3A4B
    LDI r10, 0
    LDI r7, 0
    LDI r2, 256
    LDI r0, 24
    RECTF r10, r7, r2, r0, r8

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r10, 80
    LDI r7, 6
    LDI r20, TXT_BUF
    TEXT r10, r7, r20

    ; Main time panel
    LDI r8, 0x060612
    LDI r10, 20
    LDI r7, 35
    LDI r2, 216
    LDI r0, 70
    RECTF r10, r7, r2, r0, r8

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r4, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r9, 6000
    MOV r15, r4
    DIV r15, r9

    ; Remaining = elapsed % 6000
    MOV r14, r4
    MOD r14, r9

    ; Seconds = remaining / 100
    LDI r6, 100
    MOV r3, r14
    DIV r3, r6

    ; Centiseconds = remaining % 100
    MOV r16, r14
    MOD r16, r6

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r15, r15        ; minutes
    CALL fmt_2digit

    LDI r8, 0x3A       ; ':'
    STORE r20, r8
    ADDI r20, 1

    MOV r15, r3        ; seconds
    CALL fmt_2digit

    LDI r8, 0x2E       ; '.'
    STORE r20, r8
    ADDI r20, 1

    MOV r15, r16        ; centiseconds
    CALL fmt_2digit

    LDI r8, 0
    STORE r20, r8

    ; Draw time (white text)
    LDI r10, 55
    LDI r7, 58
    LDI r20, TXT_BUF
    TEXT r10, r7, r20

    ; Status panel
    LDI r8, 0x0D0D1A
    LDI r10, 20
    LDI r7, 115
    LDI r2, 216
    LDI r0, 45
    RECTF r10, r7, r2, r0, r8

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r0, r20
    CMPI r0, 0
    JNZ r12, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r10, 80
    LDI r7, 128
    LDI r2, 0xFF4444
    DRAWTEXT r10, r7, r20, r2, r2
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r10, 80
    LDI r7, 128
    LDI r2, 0x44FF44
    DRAWTEXT r10, r7, r20, r2, r2

show_status_done:
    ; Lap panel
    LDI r8, 0x101828
    LDI r10, 20
    LDI r7, 170
    LDI r2, 216
    LDI r0, 50
    RECTF r10, r7, r2, r0, r8

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r15, r21
    CALL fmt_2digit
    LDI r8, 0
    STORE r20, r8

    LDI r10, 80
    LDI r7, 185
    LDI r20, TXT_BUF
    TEXT r10, r7, r20

    ; Bottom bar
    LDI r8, 0x0A0A1A
    LDI r10, 0
    LDI r7, 240
    LDI r2, 256
    LDI r0, 16
    RECTF r10, r7, r2, r0, r8

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r15 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r15
    DIV r22, r21       ; tens
    MOV r23, r15
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
