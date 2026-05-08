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
    LDI r3, 1
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
    LDI r3, 1

    ; Read keyboard
    IKEY r12

    ; Space (32) = toggle running
    CMPI r12, 32
    JNZ r6, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r12, 76
    JNZ r6, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r12, 82
    JNZ r6, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r14, r20
    CMPI r14, 0
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
    LOAD r14, r20
    CMPI r14, 0
    JNZ r6, was_running
    LDI r14, 1
    STORE r20, r14
    JMP toggle_done
was_running:
    LDI r14, 0
    STORE r20, r14
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r3, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r14, r20
    ADDI r14, 1
    STORE r20, r14

    ; Check if 60 frames passed (1 second)
    CMPI r14, 60
    BLT r6, update_done

    ; Reset frame accumulator
    LDI r14, 0
    STORE r20, r14

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r14, r20
    ADDI r14, 100
    STORE r20, r14

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r3, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r14, r20
    CMPI r14, 10
    BGE r6, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r15, r20
    LDI r20, LAST_LAP
    LOAD r1, r20
    SUB r15, r1         ; r15 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r14        ; r21 = LAP_BASE + lap_count
    STORE r21, r15

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r15, r20
    LDI r20, LAST_LAP
    STORE r20, r15

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r14, r20
    ADDI r14, 1
    STORE r20, r14

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
    LDI r3, 1

    ; Background
    LDI r4, 0x0D1B2A
    FILL r4

    ; Title bar
    LDI r4, 0x1B3A4B
    LDI r0, 0
    LDI r11, 0
    LDI r12, 256
    LDI r14, 24
    RECTF r0, r11, r12, r14, r4

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r0, 80
    LDI r11, 6
    LDI r20, TXT_BUF
    TEXT r0, r11, r20

    ; Main time panel
    LDI r4, 0x060612
    LDI r0, 20
    LDI r11, 35
    LDI r12, 216
    LDI r14, 70
    RECTF r0, r11, r12, r14, r4

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r10, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r8, 6000
    MOV r7, r10
    DIV r7, r8

    ; Remaining = elapsed % 6000
    MOV r13, r10
    MOD r13, r8

    ; Seconds = remaining / 100
    LDI r2, 100
    MOV r9, r13
    DIV r9, r2

    ; Centiseconds = remaining % 100
    MOV r16, r13
    MOD r16, r2

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r7, r7        ; minutes
    CALL fmt_2digit

    LDI r4, 0x3A       ; ':'
    STORE r20, r4
    ADDI r20, 1

    MOV r7, r9        ; seconds
    CALL fmt_2digit

    LDI r4, 0x2E       ; '.'
    STORE r20, r4
    ADDI r20, 1

    MOV r7, r16        ; centiseconds
    CALL fmt_2digit

    LDI r4, 0
    STORE r20, r4

    ; Draw time (white text)
    LDI r0, 55
    LDI r11, 58
    LDI r20, TXT_BUF
    TEXT r0, r11, r20

    ; Status panel
    LDI r4, 0x0D0D1A
    LDI r0, 20
    LDI r11, 115
    LDI r12, 216
    LDI r14, 45
    RECTF r0, r11, r12, r14, r4

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r14, r20
    CMPI r14, 0
    JNZ r6, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r0, 80
    LDI r11, 128
    LDI r12, 0xFF4444
    DRAWTEXT r0, r11, r20, r12, r12
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r0, 80
    LDI r11, 128
    LDI r12, 0x44FF44
    DRAWTEXT r0, r11, r20, r12, r12

show_status_done:
    ; Lap panel
    LDI r4, 0x101828
    LDI r0, 20
    LDI r11, 170
    LDI r12, 216
    LDI r14, 50
    RECTF r0, r11, r12, r14, r4

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r7, r21
    CALL fmt_2digit
    LDI r4, 0
    STORE r20, r4

    LDI r0, 80
    LDI r11, 185
    LDI r20, TXT_BUF
    TEXT r0, r11, r20

    ; Bottom bar
    LDI r4, 0x0A0A1A
    LDI r0, 0
    LDI r11, 240
    LDI r12, 256
    LDI r14, 16
    RECTF r0, r11, r12, r14, r4

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r7 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r7
    DIV r22, r21       ; tens
    MOV r23, r7
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
