; DESCRIPTION: This GeOS assembly code implements a layered sound effects demo that simulates audio mixing by playing overlapping BEEP and NOTE calls. It features a walking rhythm with low thuds and an ambient tone overlay, controlled via keyboard inputs for tempo adjustment and waveform changes, with visual indicators on the screen.

; sfx_mixer.asm -- Layered Sound Effects Demo
; Demonstrates overlapping BEEP and NOTE calls to simulate audio mixing.
; Plays a walking rhythm (low thuds) with an ambient tone overlay.
; Uses FRAME for animation loop, IKEY for interaction.
;
; Controls:
;   W/S - increase/decrease tempo
;   A/D - change ambient waveform (sine/square/triangle/sawtooth)
;   Q   - quit
;
; Memory map:
;   0x2400 tempo (frames between steps, default 15)
;   0x2404 ambient_wave (0=sine, 1=square, 2=triangle, 3=sawtooth)
;   0x2408 step_phase (0=left, 1=right foot)
;   0x240C frame_counter

; ── Init ───────────────────────────────────────────────────────
LDI r2, 15
LDI r10, 0x2400
STORE r10, r2           ; tempo = 15 frames between steps

LDI r2, 0
LDI r10, 0x2404
STORE r10, r2           ; ambient_wave = 0 (sine)

LDI r2, 0
LDI r10, 0x2408
STORE r10, r2           ; step_phase = 0 (left foot)

LDI r2, 0
LDI r10, 0x240C
STORE r10, r2           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r2, 0x000000
FILL r2                ; clear screen black

LDI r2, 0x00FF00
LDI r15, 80
LDI r8, 20
LDI r10, 0x2500
LDI r2, 83             ; 'S'
STORE r10, r2
ADD r10, r0
LDI r2, 70             ; 'F'
STORE r10, r2
ADD r10, r0
LDI r2, 88             ; 'X'
STORE r10, r2
ADD r10, r0
LDI r2, 95             ; '_'
STORE r10, r2
ADD r10, r0
LDI r2, 77             ; 'M'
STORE r10, r2
ADD r10, r0
LDI r2, 73             ; 'I'
STORE r10, r2
ADD r10, r0
LDI r2, 88             ; 'X'
STORE r10, r2
ADD r10, r0
LDI r2, 69             ; 'E'
STORE r10, r2
ADD r10, r0
LDI r2, 82             ; 'R'
STORE r10, r2
ADD r10, r0
LDI r2, 0              ; null terminator
STORE r10, r2
LDI r10, 0x2500
TEXT r15, r8, r10

; Instructions
LDI r10, 0x2520
LDI r2, 87
STORE r10, r2
ADD r10, r0
LDI r2, 47
STORE r10, r2
ADD r10, r0
LDI r2, 83
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 61
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 84
STORE r10, r2
ADD r10, r0
LDI r2, 69
STORE r10, r2
ADD r10, r0
LDI r2, 77
STORE r10, r2
ADD r10, r0
LDI r2, 80
STORE r10, r2
ADD r10, r0
LDI r2, 79
STORE r10, r2
ADD r10, r0
LDI r2, 0
STORE r10, r2
LDI r15, 80
LDI r8, 40
LDI r10, 0x2520
TEXT r15, r8, r10

; A/D line
LDI r10, 0x2540
LDI r2, 65
STORE r10, r2
ADD r10, r0
LDI r2, 47
STORE r10, r2
ADD r10, r0
LDI r2, 68
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 61
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 87
STORE r10, r2
ADD r10, r0
LDI r2, 65
STORE r10, r2
ADD r10, r0
LDI r2, 86
STORE r10, r2
ADD r10, r0
LDI r2, 69
STORE r10, r2
ADD r10, r0
LDI r2, 0
STORE r10, r2
LDI r15, 80
LDI r8, 50
LDI r10, 0x2540
TEXT r15, r8, r10

; Q line
LDI r10, 0x2560
LDI r2, 81
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 61
STORE r10, r2
ADD r10, r0
LDI r2, 32
STORE r10, r2
ADD r10, r0
LDI r2, 81
STORE r10, r2
ADD r10, r0
LDI r2, 85
STORE r10, r2
ADD r10, r0
LDI r2, 73
STORE r10, r2
ADD r10, r0
LDI r2, 84
STORE r10, r2
ADD r10, r0
LDI r2, 0
STORE r10, r2
LDI r15, 80
LDI r8, 60
LDI r10, 0x2560
TEXT r15, r8, r10

; ── Main Loop ──────────────────────────────────────────────────
LDI r0, 1              ; constant 1
LDI r7, 0xFFE          ; TICKS port
LDI r3, 0x2400         ; tempo addr
LDI r12, 0x2404        ; ambient_wave addr
LDI r9, 0x2408        ; step_phase addr
LDI r14, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r2, 0x000000
    FILL r2            ; clear screen

    ; Increment frame counter
    LDI r10, 0x240C
    LDI r2, 0
    LOAD r2, r10
    ADD r2, r0
    STORE r10, r2

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r1            ; r1 = key (0 if none)

    ; Q = quit
    LDI r2, 81
    CMP r1, r2
    JZ r6, do_quit

    ; W = increase tempo (decrease delay)
    LDI r2, 87
    CMP r1, r2
    JZ r6, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r2, 83
    CMP r1, r2
    JZ r6, tempo_down

    ; A = prev waveform
    LDI r2, 65
    CMP r1, r2
    JZ r6, wave_prev

    ; D = next waveform
    LDI r2, 68
    CMP r1, r2
    JZ r6, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r10, 0x2400
    LDI r2, 0
    LOAD r2, r10
    LDI r13, 5
    CMP r2, r13
    BLT r6, check_step  ; min tempo = 5
    LDI r13, 2
    SUB r2, r13
    STORE r10, r2
    JMP check_step

tempo_down:
    LDI r10, 0x2400
    LDI r2, 0
    LOAD r2, r10
    LDI r13, 60
    CMP r2, r13
    BGE r6, check_step  ; max tempo = 60
    LDI r13, 2
    ADD r2, r13
    STORE r10, r2
    JMP check_step

wave_prev:
    LDI r10, 0x2404
    LDI r2, 0
    LOAD r2, r10
    JZ r2, check_step  ; already at 0
    LDI r13, 1
    SUB r2, r13
    STORE r10, r2
    JMP check_step

wave_next:
    LDI r10, 0x2404
    LDI r2, 0
    LOAD r2, r10
    LDI r13, 3
    CMP r2, r13
    BGE r6, check_step ; max wave = 3 (sawtooth)
    LDI r13, 1
    ADD r2, r13
    STORE r10, r2
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r1, r7
    ; Read tempo
    LDI r10, 0x2400
    LDI r2, 0
    LOAD r2, r10
    ; ticks % tempo
    MOV r13, r1
    LDI r4, 0
    CMP r2, r4
    JZ r6, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r13 = ticks % tempo, check if 0
    JZ r13, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r10, 0x2408
    LDI r2, 0
    LOAD r2, r10         ; r2 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r2, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r2, 120
    LDI r13, 40
    BEEP r2, r13
    JMP toggle_phase

left_foot:
    LDI r2, 80
    LDI r13, 50
    BEEP r2, r13

toggle_phase:
    LDI r10, 0x2408
    LDI r2, 0
    LOAD r2, r10
    LDI r13, 1
    XOR r2, r13          ; toggle 0<->1
    STORE r10, r2

    ; Draw step indicator
    LDI r2, 0x2408
    LDI r4, 0
    LOAD r4, r2         ; r4 = phase
    LDI r2, 0xFF4444    ; red dot for left
    LDI r10, 0x44FF44    ; green dot for right
    JZ r4, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r1, r14       ; r1 = frame_counter
    LDI r2, 120
    CALL mod16          ; r13 = frame_counter % 120
    JZ r13, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r10, 0x2404
    LDI r2, 0
    LOAD r2, r10         ; r2 = waveform type

    LDI r13, 220         ; A3 = 220Hz
    LDI r4, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r2=wave, r13=freq, r4=dur already set
    NOTE r2, r13, r4

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r10, 0x2400
    LDI r2, 0
    LOAD r2, r10         ; r2 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r15, 20
    LDI r8, 100
    MOV r12, r2
    LDI r4, 3
    MUL r12, r4         ; r12 = tempo * 3 (bar width)
    LDI r9, 30         ; bar height
    LDI r3, 0x336699    ; steel blue
    RECTF r15, r8, r12, r9, r3

    ; Tempo label
    LDI r10, 0x2580
    LDI r2, 84
    STORE r10, r2
    ADD r10, r0
    LDI r2, 58
    STORE r10, r2
    ADD r10, r0
    LDI r2, 77
    STORE r10, r2
    ADD r10, r0
    LDI r2, 80
    STORE r10, r2
    ADD r10, r0
    LDI r2, 79
    STORE r10, r2
    ADD r10, r0
    LDI r2, 58
    STORE r10, r2
    ADD r10, r0
    LDI r2, 0
    STORE r10, r2
    LDI r15, 20
    LDI r8, 140
    LDI r10, 0x2580
    TEXT r15, r8, r10

    ; Waveform indicator
    LDI r10, 0x2404
    LDI r2, 0
    LOAD r2, r10         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r2, wave_sine
    LDI r13, 1
    CMP r2, r13
    JZ r6, wave_square
    LDI r13, 2
    CMP r2, r13
    JZ r6, wave_triangle
    JMP wave_saw

wave_sine:
    PSETI 200, 90, 0x00FFFF
    JMP hud_done

wave_square:
    PSETI 200, 90, 0xFFFF00
    JMP hud_done

wave_triangle:
    PSETI 200, 90, 0xFF00FF
    JMP hud_done

wave_saw:
    PSETI 200, 90, 0xFF8800
    JMP hud_done

hud_done:
    JMP main_loop

    ; ── Helper: mod16 (r13 = r1 % r2) ─────────────────────────
    ; r1 = dividend, r2 = divisor
    ; Returns r13 = remainder
    ; Clobbers r5, r11
mod16:
    PUSH r31
    PUSH r2
    PUSH r5
    PUSH r11
    MOV r13, r1
    MOV r5, r2          ; r5 = divisor
    LDI r11, 0           ; r11 = quotient
mod_loop:
    CMP r13, r5
    BLT r6, mod_done
    SUB r13, r5
    ADD r11, r0
    JMP mod_loop
mod_done:
    POP r11
    POP r5
    POP r2
    POP r31
    RET
