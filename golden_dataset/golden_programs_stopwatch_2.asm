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
    LDI r4, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r4
    LDI r20, ELAPSED_CS
    STORE r20, r4
    LDI r20, FRAME_ACC
    STORE r20, r4
    LDI r20, LAP_COUNT
    STORE r20, r4
    LDI r20, LAST_LAP
    STORE r20, r4

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r9, 1

    ; Read keyboard
    IKEY r6

    ; Space (32) = toggle running
    CMPI r6, 32
    JNZ r0, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r6, 76
    JNZ r0, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r6, 82
    JNZ r0, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r15, r20
    CMPI r15, 0
    JZ r0, skip_update
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
    LOAD r15, r20
    CMPI r15, 0
    JNZ r0, was_running
    LDI r15, 1
    STORE r20, r15
    JMP toggle_done
was_running:
    LDI r15, 0
    STORE r20, r15
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r9, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r15, r20
    ADDI r15, 1
    STORE r20, r15

    ; Check if 60 frames passed (1 second)
    CMPI r15, 60
    BLT r0, update_done

    ; Reset frame accumulator
    LDI r15, 0
    STORE r20, r15

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r15, r20
    ADDI r15, 100
    STORE r20, r15

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r9, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r15, r20
    CMPI r15, 10
    BGE r0, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r13, r20
    LDI r20, LAST_LAP
    LOAD r10, r20
    SUB r13, r10         ; r13 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r15        ; r21 = LAP_BASE + lap_count
    STORE r21, r13

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r13, r20
    LDI r20, LAST_LAP
    STORE r20, r13

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r15, r20
    ADDI r15, 1
    STORE r20, r15

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r4, 0

    LDI r20, RUNNING
    STORE r20, r4
    LDI r20, ELAPSED_CS
    STORE r20, r4
    LDI r20, FRAME_ACC
    STORE r20, r4
    LDI r20, LAP_COUNT
    STORE r20, r4
    LDI r20, LAST_LAP
    STORE r20, r4

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r9, 1

    ; Background
    LDI r4, 0x0D1B2A
    FILL r4

    ; Title bar
    LDI r4, 0x1B3A4B
    LDI r14, 0
    LDI r3, 0
    LDI r6, 256
    LDI r15, 24
    RECTF r14, r3, r6, r15, r4

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r14, 80
    LDI r3, 6
    LDI r20, TXT_BUF
    TEXT r14, r3, r20

    ; Main time panel
    LDI r4, 0x060612
    LDI r14, 20
    LDI r3, 35
    LDI r6, 216
    LDI r15, 70
    RECTF r14, r3, r6, r15, r4

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r1, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r8, 6000
    MOV r2, r1
    DIV r2, r8

    ; Remaining = elapsed % 6000
    MOV r7, r1
    MOD r7, r8

    ; Seconds = remaining / 100
    LDI r5, 100
    MOV r11, r7
    DIV r11, r5

    ; Centiseconds = remaining % 100
    MOV r16, r7
    MOD r16, r5

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r2, r2        ; minutes
    CALL fmt_2digit

    LDI r4, 0x3A       ; ':'
    STORE r20, r4
    ADDI r20, 1

    MOV r2, r11        ; seconds
    CALL fmt_2digit

    LDI r4, 0x2E       ; '.'
    STORE r20, r4
    ADDI r20, 1

    MOV r2, r16        ; centiseconds
    CALL fmt_2digit

    LDI r4, 0
    STORE r20, r4

    ; Draw time (white text)
    LDI r14, 55
    LDI r3, 58
    LDI r20, TXT_BUF
    TEXT r14, r3, r20

    ; Status panel
    LDI r4, 0x0D0D1A
    LDI r14, 20
    LDI r3, 115
    LDI r6, 216
    LDI r15, 45
    RECTF r14, r3, r6, r15, r4

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r15, r20
    CMPI r15, 0
    JNZ r0, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r14, 80
    LDI r3, 128
    LDI r6, 0xFF4444
    DRAWTEXT r14, r3, r20, r6, r6
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r14, 80
    LDI r3, 128
    LDI r6, 0x44FF44
    DRAWTEXT r14, r3, r20, r6, r6

show_status_done:
    ; Lap panel
    LDI r4, 0x101828
    LDI r14, 20
    LDI r3, 170
    LDI r6, 216
    LDI r15, 50
    RECTF r14, r3, r6, r15, r4

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r2, r21
    CALL fmt_2digit
    LDI r4, 0
    STORE r20, r4

    LDI r14, 80
    LDI r3, 185
    LDI r20, TXT_BUF
    TEXT r14, r3, r20

    ; Bottom bar
    LDI r4, 0x0A0A1A
    LDI r14, 0
    LDI r3, 240
    LDI r6, 256
    LDI r15, 16
    RECTF r14, r3, r6, r15, r4

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r2 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r2
    DIV r22, r21       ; tens
    MOV r23, r2
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
