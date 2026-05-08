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
    LDI r1, 1
    LDI r10, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r10
    LDI r20, ELAPSED_CS
    STORE r20, r10
    LDI r20, FRAME_ACC
    STORE r20, r10
    LDI r20, LAP_COUNT
    STORE r20, r10
    LDI r20, LAST_LAP
    STORE r20, r10

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r1, 1

    ; Read keyboard
    IKEY r8

    ; Space (32) = toggle running
    CMPI r8, 32
    JNZ r0, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r8, 76
    JNZ r0, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r8, 82
    JNZ r0, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 0
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
    LOAD r9, r20
    CMPI r9, 0
    JNZ r0, was_running
    LDI r9, 1
    STORE r20, r9
    JMP toggle_done
was_running:
    LDI r9, 0
    STORE r20, r9
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r1, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r9, r20
    ADDI r9, 1
    STORE r20, r9

    ; Check if 60 frames passed (1 second)
    CMPI r9, 60
    BLT r0, update_done

    ; Reset frame accumulator
    LDI r9, 0
    STORE r20, r9

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r9, r20
    ADDI r9, 100
    STORE r20, r9

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r1, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r9, r20
    CMPI r9, 10
    BGE r0, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r7, r20
    LDI r20, LAST_LAP
    LOAD r12, r20
    SUB r7, r12         ; r7 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r9        ; r21 = LAP_BASE + lap_count
    STORE r21, r7

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r7, r20
    LDI r20, LAST_LAP
    STORE r20, r7

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r9, r20
    ADDI r9, 1
    STORE r20, r9

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r10, 0

    LDI r20, RUNNING
    STORE r20, r10
    LDI r20, ELAPSED_CS
    STORE r20, r10
    LDI r20, FRAME_ACC
    STORE r20, r10
    LDI r20, LAP_COUNT
    STORE r20, r10
    LDI r20, LAST_LAP
    STORE r20, r10

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r1, 1

    ; Background
    LDI r10, 0x0D1B2A
    FILL r10

    ; Title bar
    LDI r10, 0x1B3A4B
    LDI r15, 0
    LDI r4, 0
    LDI r8, 256
    LDI r9, 24
    RECTF r15, r4, r8, r9, r10

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r15, 80
    LDI r4, 6
    LDI r20, TXT_BUF
    TEXT r15, r4, r20

    ; Main time panel
    LDI r10, 0x060612
    LDI r15, 20
    LDI r4, 35
    LDI r8, 216
    LDI r9, 70
    RECTF r15, r4, r8, r9, r10

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r3, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r6, 6000
    MOV r14, r3
    DIV r14, r6

    ; Remaining = elapsed % 6000
    MOV r11, r3
    MOD r11, r6

    ; Seconds = remaining / 100
    LDI r5, 100
    MOV r13, r11
    DIV r13, r5

    ; Centiseconds = remaining % 100
    MOV r16, r11
    MOD r16, r5

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r14, r14        ; minutes
    CALL fmt_2digit

    LDI r10, 0x3A       ; ':'
    STORE r20, r10
    ADDI r20, 1

    MOV r14, r13        ; seconds
    CALL fmt_2digit

    LDI r10, 0x2E       ; '.'
    STORE r20, r10
    ADDI r20, 1

    MOV r14, r16        ; centiseconds
    CALL fmt_2digit

    LDI r10, 0
    STORE r20, r10

    ; Draw time (white text)
    LDI r15, 55
    LDI r4, 58
    LDI r20, TXT_BUF
    TEXT r15, r4, r20

    ; Status panel
    LDI r10, 0x0D0D1A
    LDI r15, 20
    LDI r4, 115
    LDI r8, 216
    LDI r9, 45
    RECTF r15, r4, r8, r9, r10

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r9, r20
    CMPI r9, 0
    JNZ r0, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r15, 80
    LDI r4, 128
    LDI r8, 0xFF4444
    DRAWTEXT r15, r4, r20, r8, r8
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r15, 80
    LDI r4, 128
    LDI r8, 0x44FF44
    DRAWTEXT r15, r4, r20, r8, r8

show_status_done:
    ; Lap panel
    LDI r10, 0x101828
    LDI r15, 20
    LDI r4, 170
    LDI r8, 216
    LDI r9, 50
    RECTF r15, r4, r8, r9, r10

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r14, r21
    CALL fmt_2digit
    LDI r10, 0
    STORE r20, r10

    LDI r15, 80
    LDI r4, 185
    LDI r20, TXT_BUF
    TEXT r15, r4, r20

    ; Bottom bar
    LDI r10, 0x0A0A1A
    LDI r15, 0
    LDI r4, 240
    LDI r8, 256
    LDI r9, 16
    RECTF r15, r4, r8, r9, r10

    POP r31
    RET

; ── FMT 2 DIGIT ───────────────────────────────────
; Formats r14 as 2-digit decimal, writes to RAM[r20], advances r20
fmt_2digit:
    PUSH r31
    LDI r21, 10
    MOV r22, r14
    DIV r22, r21       ; tens
    MOV r23, r14
    MOD r23, r21       ; ones
    ADDI r22, 0x30
    STORE r20, r22
    ADDI r20, 1
    ADDI r23, 0x30
    STORE r20, r23
    ADDI r20, 1
    POP r31
    RET
