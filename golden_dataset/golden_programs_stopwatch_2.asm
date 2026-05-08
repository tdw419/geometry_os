; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

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
    LDI r0, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r0
    LDI r20, ELAPSED_CS
    STORE r20, r0
    LDI r20, FRAME_ACC
    STORE r20, r0
    LDI r20, LAP_COUNT
    STORE r20, r0
    LDI r20, LAST_LAP
    STORE r20, r0

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r9, 1

    ; Read keyboard
    IKEY r5

    ; Space (32) = toggle running
    CMPI r5, 32
    JNZ r11, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r5, 76
    JNZ r11, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r5, 82
    JNZ r11, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r10, r20
    CMPI r10, 0
    JZ r11, skip_update
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
    JNZ r11, was_running
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
    BLT r11, update_done

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
    BGE r11, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r14, r20
    LDI r20, LAST_LAP
    LOAD r15, r20
    SUB r14, r15         ; r14 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r10        ; r21 = LAP_BASE + lap_count
    STORE r21, r14

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r14, r20
    LDI r20, LAST_LAP
    STORE r20, r14

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
    LDI r0, 0

    LDI r20, RUNNING
    STORE r20, r0
    LDI r20, ELAPSED_CS
    STORE r20, r0
    LDI r20, FRAME_ACC
    STORE r20, r0
    LDI r20, LAP_COUNT
    STORE r20, r0
    LDI r20, LAST_LAP
    STORE r20, r0

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r9, 1

    ; Background
    LDI r0, 0x0D1B2A
    FILL r0

    ; Title bar
    LDI r0, 0x1B3A4B
    LDI r2, 0
    LDI r13, 0
    LDI r5, 256
    LDI r10, 24
    RECTF r2, r13, r5, r10, r0

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r2, 80
    LDI r13, 6
    LDI r20, TXT_BUF
    TEXT r2, r13, r20

    ; Main time panel
    LDI r0, 0x060612
    LDI r2, 20
    LDI r13, 35
    LDI r5, 216
    LDI r10, 70
    RECTF r2, r13, r5, r10, r0

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r12, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r8, 6000
    MOV r1, r12
    DIV r1, r8

    ; Remaining = elapsed % 6000
    MOV r7, r12
    MOD r7, r8

    ; Seconds = remaining / 100
    LDI r3, 100
    MOV r4, r7
    DIV r4, r3

    ; Centiseconds = remaining % 100
    MOV r16, r7
    MOD r16, r3

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r1, r1        ; minutes
    CALL fmt_2digit

    LDI r0, 0x3A       ; ':'
    STORE r20, r0
    ADDI r20, 1

    MOV r1, r4        ; seconds
    CALL fmt_2digit

    LDI r0, 0x2E       ; '.'
    STORE r20, r0
    ADDI r20, 1

    MOV r1, r16        ; centiseconds
    CALL fmt_2digit

    LDI r0, 0
    STORE r20, r0

    ; Draw time (white text)
    LDI r2, 55
    LDI r13, 58
    LDI r20, TXT_BUF
    TEXT r2, r13, r20

    ; Status panel
    LDI r0, 0x0D0D1A
    LDI r2, 20
    LDI r13, 115
    LDI r5, 216
    LDI r10, 45
    RECTF r2, r13, r5, r10, r0

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r10, r20
    CMPI r10, 0
    JNZ r11, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r2, 80
    LDI r13, 128
    LDI r5, 0xFF4444
    DRAWTEXT r2, r13, r20, r5, r5
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r2, 80
    LDI r13, 128
    LDI r5, 0x44FF44
    DRAWTEXT r2, r13, r20, r5, r5

show_status_done:
    ; Lap panel
    LDI r0, 0x101828
    LDI r2, 20
    LDI r13, 170
    LDI r5, 216
    LDI r10, 50
    RECTF r2, r13, r5, r10, r0

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r1, r21
    CALL fmt_2digit
    LDI r0, 0
    STORE r20, r0

    LDI r2, 80
    LDI r13, 185
    LDI r20, TXT_BUF
    TEXT r2, r13, r20

    ; Bottom bar
    LDI r0, 0x0A0A1A
    LDI r2, 0
    LDI r13, 240
    LDI r5, 256
    LDI r10, 16
    RECTF r2, r13, r5, r10, r0

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r1 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r1
    DIV r22, r21       ; tens
    MOV r23, r1
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
