; DESCRIPTION: Display a rectangle using color colored at the screen.

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
    LDI r5, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r5
    LDI r20, ELAPSED_CS
    STORE r20, r5
    LDI r20, FRAME_ACC
    STORE r20, r5
    LDI r20, LAP_COUNT
    STORE r20, r5
    LDI r20, LAST_LAP
    STORE r20, r5

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r3, 1

    ; Read keyboard
    IKEY r2

    ; Space (32) = toggle running
    CMPI r2, 32
    JNZ r9, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r2, 76
    JNZ r9, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r2, 82
    JNZ r9, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r7, r20
    CMPI r7, 0
    JZ r9, skip_update
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
    LOAD r7, r20
    CMPI r7, 0
    JNZ r9, was_running
    LDI r7, 1
    STORE r20, r7
    JMP toggle_done
was_running:
    LDI r7, 0
    STORE r20, r7
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r3, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r7, r20
    ADDI r7, 1
    STORE r20, r7

    ; Check if 60 frames passed (1 second)
    CMPI r7, 60
    BLT r9, update_done

    ; Reset frame accumulator
    LDI r7, 0
    STORE r20, r7

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r7, r20
    ADDI r7, 100
    STORE r20, r7

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r3, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r7, r20
    CMPI r7, 10
    BGE r9, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r4, r20
    LDI r20, LAST_LAP
    LOAD r0, r20
    SUB r4, r0         ; r4 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r7        ; r21 = LAP_BASE + lap_count
    STORE r21, r4

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r4, r20
    LDI r20, LAST_LAP
    STORE r20, r4

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r7, r20
    ADDI r7, 1
    STORE r20, r7

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r5, 0

    LDI r20, RUNNING
    STORE r20, r5
    LDI r20, ELAPSED_CS
    STORE r20, r5
    LDI r20, FRAME_ACC
    STORE r20, r5
    LDI r20, LAP_COUNT
    STORE r20, r5
    LDI r20, LAST_LAP
    STORE r20, r5

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r3, 1

    ; Background
    LDI r5, 0x0D1B2A
    FILL r5

    ; Title bar
    LDI r5, 0x1B3A4B
    LDI r10, 0
    LDI r14, 0
    LDI r2, 256
    LDI r7, 24
    RECTF r10, r14, r2, r7, r5

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r10, 80
    LDI r14, 6
    LDI r20, TXT_BUF
    TEXT r10, r14, r20

    ; Main time panel
    LDI r5, 0x060612
    LDI r10, 20
    LDI r14, 35
    LDI r2, 216
    LDI r7, 70
    RECTF r10, r14, r2, r7, r5

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r15, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r8, 6000
    MOV r12, r15
    DIV r12, r8

    ; Remaining = elapsed % 6000
    MOV r13, r15
    MOD r13, r8

    ; Seconds = remaining / 100
    LDI r6, 100
    MOV r1, r13
    DIV r1, r6

    ; Centiseconds = remaining % 100
    MOV r16, r13
    MOD r16, r6

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r12, r12        ; minutes
    CALL fmt_2digit

    LDI r5, 0x3A       ; ':'
    STORE r20, r5
    ADDI r20, 1

    MOV r12, r1        ; seconds
    CALL fmt_2digit

    LDI r5, 0x2E       ; '.'
    STORE r20, r5
    ADDI r20, 1

    MOV r12, r16        ; centiseconds
    CALL fmt_2digit

    LDI r5, 0
    STORE r20, r5

    ; Draw time (white text)
    LDI r10, 55
    LDI r14, 58
    LDI r20, TXT_BUF
    TEXT r10, r14, r20

    ; Status panel
    LDI r5, 0x0D0D1A
    LDI r10, 20
    LDI r14, 115
    LDI r2, 216
    LDI r7, 45
    RECTF r10, r14, r2, r7, r5

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r7, r20
    CMPI r7, 0
    JNZ r9, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r10, 80
    LDI r14, 128
    LDI r2, 0xFF4444
    DRAWTEXT r10, r14, r20, r2, r2
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r10, 80
    LDI r14, 128
    LDI r2, 0x44FF44
    DRAWTEXT r10, r14, r20, r2, r2

show_status_done:
    ; Lap panel
    LDI r5, 0x101828
    LDI r10, 20
    LDI r14, 170
    LDI r2, 216
    LDI r7, 50
    RECTF r10, r14, r2, r7, r5

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r12, r21
    CALL fmt_2digit
    LDI r5, 0
    STORE r20, r5

    LDI r10, 80
    LDI r14, 185
    LDI r20, TXT_BUF
    TEXT r10, r14, r20

    ; Bottom bar
    LDI r5, 0x0A0A1A
    LDI r10, 0
    LDI r14, 240
    LDI r2, 256
    LDI r7, 16
    RECTF r10, r14, r2, r7, r5

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r12 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r12
    DIV r22, r21       ; tens
    MOV r23, r12
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
