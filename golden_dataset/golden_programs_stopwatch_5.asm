; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

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
    LDI r9, 0

    ; Init all state to zero
    LDI r20, RUNNING
    STORE r20, r9
    LDI r20, ELAPSED_CS
    STORE r20, r9
    LDI r20, FRAME_ACC
    STORE r20, r9
    LDI r20, LAP_COUNT
    STORE r20, r9
    LDI r20, LAST_LAP
    STORE r20, r9

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r3, 1

    ; Read keyboard
    IKEY r11

    ; Space (32) = toggle running
    CMPI r11, 32
    JNZ r14, not_space
    CALL toggle_running
    JMP main_loop
not_space:

    ; L (76) = lap
    CMPI r11, 76
    JNZ r14, not_lap
    CALL record_lap
    JMP main_loop
not_lap:

    ; R (82) = reset
    CMPI r11, 82
    JNZ r14, not_reset
    CALL reset_stopwatch
    JMP main_loop
not_reset:

    ; Update elapsed time if running
    LDI r20, RUNNING
    LOAD r2, r20
    CMPI r2, 0
    JZ r14, skip_update
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
    LOAD r2, r20
    CMPI r2, 0
    JNZ r14, was_running
    LDI r2, 1
    STORE r20, r2
    JMP toggle_done
was_running:
    LDI r2, 0
    STORE r20, r2
toggle_done:
    POP r31
    RET

; ── UPDATE TIME ───────────────────────────────────
update_time:
    PUSH r31
    LDI r3, 1

    ; frame_acc++
    LDI r20, FRAME_ACC
    LOAD r2, r20
    ADDI r2, 1
    STORE r20, r2

    ; Check if 60 frames passed (1 second)
    CMPI r2, 60
    BLT r14, update_done

    ; Reset frame accumulator
    LDI r2, 0
    STORE r20, r2

    ; elapsed_cs += 100
    LDI r20, ELAPSED_CS
    LOAD r2, r20
    ADDI r2, 100
    STORE r20, r2

update_done:
    POP r31
    RET

; ── RECORD LAP ────────────────────────────────────
record_lap:
    PUSH r31
    LDI r3, 1

    ; Check lap count < 10
    LDI r20, LAP_COUNT
    LOAD r2, r20
    CMPI r2, 10
    BGE r14, lap_full

    ; Compute lap delta = elapsed - last_lap
    LDI r20, ELAPSED_CS
    LOAD r8, r20
    LDI r20, LAST_LAP
    LOAD r10, r20
    SUB r8, r10         ; r8 = delta

    ; Store delta at LAP_BASE + lap_count
    LDI r21, LAP_BASE
    ADD r21, r2        ; r21 = LAP_BASE + lap_count
    STORE r21, r8

    ; Update last_lap
    LDI r20, ELAPSED_CS
    LOAD r8, r20
    LDI r20, LAST_LAP
    STORE r20, r8

    ; lap_count++
    LDI r20, LAP_COUNT
    LOAD r2, r20
    ADDI r2, 1
    STORE r20, r2

lap_full:
    POP r31
    RET

; ── RESET ─────────────────────────────────────────
reset_stopwatch:
    PUSH r31
    LDI r9, 0

    LDI r20, RUNNING
    STORE r20, r9
    LDI r20, ELAPSED_CS
    STORE r20, r9
    LDI r20, FRAME_ACC
    STORE r20, r9
    LDI r20, LAP_COUNT
    STORE r20, r9
    LDI r20, LAST_LAP
    STORE r20, r9

    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r3, 1

    ; Background
    LDI r9, 0x0D1B2A
    FILL r9

    ; Title bar
    LDI r9, 0x1B3A4B
    LDI r7, 0
    LDI r0, 0
    LDI r11, 256
    LDI r2, 24
    RECTF r7, r0, r11, r2, r9

    ; Title: "STOPWATCH"
    LDI r20, TXT_BUF
    STRO r20, "STOPWATCH"
    LDI r7, 80
    LDI r0, 6
    LDI r20, TXT_BUF
    TEXT r7, r0, r20

    ; Main time panel
    LDI r9, 0x060612
    LDI r7, 20
    LDI r0, 35
    LDI r11, 216
    LDI r2, 70
    RECTF r7, r0, r11, r2, r9

    ; Compute time components
    LDI r20, ELAPSED_CS
    LOAD r12, r20       ; total centiseconds

    ; Minutes = elapsed / 6000
    LDI r4, 6000
    MOV r5, r12
    DIV r5, r4

    ; Remaining = elapsed % 6000
    MOV r13, r12
    MOD r13, r4

    ; Seconds = remaining / 100
    LDI r6, 100
    MOV r1, r13
    DIV r1, r6

    ; Centiseconds = remaining % 100
    MOV r16, r13
    MOD r16, r6

    ; Build time string at TXT_BUF: MM:SS.CC
    LDI r20, TXT_BUF
    MOV r5, r5        ; minutes
    CALL fmt_2digit

    LDI r9, 0x3A       ; ':'
    STORE r20, r9
    ADDI r20, 1

    MOV r5, r1        ; seconds
    CALL fmt_2digit

    LDI r9, 0x2E       ; '.'
    STORE r20, r9
    ADDI r20, 1

    MOV r5, r16        ; centiseconds
    CALL fmt_2digit

    LDI r9, 0
    STORE r20, r9

    ; Draw time (white text)
    LDI r7, 55
    LDI r0, 58
    LDI r20, TXT_BUF
    TEXT r7, r0, r20

    ; Status panel
    LDI r9, 0x0D0D1A
    LDI r7, 20
    LDI r0, 115
    LDI r11, 216
    LDI r2, 45
    RECTF r7, r0, r11, r2, r9

    ; Show RUNNING or STOPPED
    LDI r20, RUNNING
    LOAD r2, r20
    CMPI r2, 0
    JNZ r14, show_running

    ; STOPPED text
    LDI r20, TXT_BUF
    STRO r20, "STOPPED"
    LDI r7, 80
    LDI r0, 128
    LDI r11, 0xFF4444
    DRAWTEXT r7, r0, r20, r11, r11
    JMP show_status_done

show_running:
    LDI r20, TXT_BUF
    STRO r20, "RUNNING"
    LDI r7, 80
    LDI r0, 128
    LDI r11, 0x44FF44
    DRAWTEXT r7, r0, r20, r11, r11

show_status_done:
    ; Lap panel
    LDI r9, 0x101828
    LDI r7, 20
    LDI r0, 170
    LDI r11, 216
    LDI r2, 50
    RECTF r7, r0, r11, r2, r9

    ; "Laps N" text
    LDI r20, TXT_BUF
    STRO r20, "Laps "
    ADDI r20, 5

    LDI r21, LAP_COUNT
    LOAD r5, r21
    CALL fmt_2digit
    LDI r9, 0
    STORE r20, r9

    LDI r7, 80
    LDI r0, 185
    LDI r20, TXT_BUF
    TEXT r7, r0, r20

    ; Bottom bar
    LDI r9, 0x0A0A1A
    LDI r7, 0
    LDI r0, 240
    LDI r11, 256
    LDI r2, 16
    RECTF r7, r0, r11, r2, r9

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
