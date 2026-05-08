; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
    LDI r15, 1
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
    LDI r15, 1

    ; Read keyboard
    IKEY r5

    ; Space (32) = toggle running
    CMPI r5, 32
    JNZ r13, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r5, 76
    JNZ r13, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r5, 82
    JNZ r13, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r3, r20
    CMPI r3, 0
    JZ r13, skip_update
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
    LOAD r3, r20
    CMPI r3, 0
    JNZ r13, was_running
    LDI r3, 1
    STORE r20, r3
    JMP toggle_done
was_running:
    LDI r3, 0
    STORE r20, r3
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r15, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r3, r20
    ADDI r3, 1
    STORE r20, r3

    ; Check if 60 frames passed (1 second)
    CMPI r3, 60
    BLT r13, update_done

    ; Reset frame accumulator
    LDI r3, 0
    STORE r20, r3

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r3, r20
    ADDI r3, 100
    STORE r20, r3

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r15, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r3, r20
    CMPI r3, 10
    BGE r13, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r6, r20
    LDI r20, LAST_LAP
    LOAD r14, r20
    SUB r6, r14         ; r6 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r3        ; r21 = LAP_BASE + lap_count
    STORE r21, r6

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r6, r20
    LDI r20, LAST_LAP
    STORE r20, r6

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r3, r20
    ADDI r3, 1
    STORE r20, r3

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
    LDI r15, 1

    ; Background
    LDI r4, 0x0D1B2A
    FILL r4

    ; Title bar
    LDI r4, 0x1B3A4B
    LDI r12, 0
    LDI r8, 0
    LDI r5, 256
    LDI r3, 24
    RECTF r12, r8, r5, r3, r4

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r12, 80
    LDI r8, 6
    LDI r20, TXT_BUF
    TEXT r12, r8, r20

    ; Main time panel
    LDI r4, 0x060612
    LDI r12, 20
    LDI r8, 35
    LDI r5, 216
    LDI r3, 70
    RECTF r12, r8, r5, r3, r4

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r11, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r2, 6000
    MOV r10, r11
    DIV r10, r2

    ; Remaining = elapsed % 6000
    MOV r0, r11
    MOD r0, r2

    ; Seconds = remaining / 100
    LDI r1, 100
    MOV r9, r0
    DIV r9, r1

    ; Centiseconds = remaining % 100
    MOV r16, r0
    MOD r16, r1

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r10, r10        ; minutes
    CALL fmt_2digit

    LDI r4, 0x3A       ; ':'
    STORE r20, r4
    ADDI r20, 1

    MOV r10, r9        ; seconds
    CALL fmt_2digit

    LDI r4, 0x2E       ; '.'
    STORE r20, r4
    ADDI r20, 1

    MOV r10, r16        ; centiseconds
    CALL fmt_2digit

    LDI r4, 0
    STORE r20, r4

    ; Draw time (white text)
    LDI r12, 55
    LDI r8, 58
    LDI r20, TXT_BUF
    TEXT r12, r8, r20

    ; Status panel
    LDI r4, 0x0D0D1A
    LDI r12, 20
    LDI r8, 115
    LDI r5, 216
    LDI r3, 45
    RECTF r12, r8, r5, r3, r4

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r3, r20
    CMPI r3, 0
    JNZ r13, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r12, 80
    LDI r8, 128
    LDI r5, 0xFF4444
    DRAWTEXT r12, r8, r20, r5, r5
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r12, 80
    LDI r8, 128
    LDI r5, 0x44FF44
    DRAWTEXT r12, r8, r20, r5, r5

show_status_done:
    ; Lap panel
    LDI r4, 0x101828
    LDI r12, 20
    LDI r8, 170
    LDI r5, 216
    LDI r3, 50
    RECTF r12, r8, r5, r3, r4

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r10, r21
    CALL fmt_2digit
    LDI r4, 0
    STORE r20, r4

    LDI r12, 80
    LDI r8, 185
    LDI r20, TXT_BUF
    TEXT r12, r8, r20

    ; Bottom bar
    LDI r4, 0x0A0A1A
    LDI r12, 0
    LDI r8, 240
    LDI r5, 256
    LDI r3, 16
    RECTF r12, r8, r5, r3, r4

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r10 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r10
    DIV r22, r21       ; tens
    MOV r23, r10
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
