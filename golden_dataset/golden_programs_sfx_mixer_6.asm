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
LDI r4, 15
LDI r9, 0x2400
STORE r9, r4           ; tempo = 15 frames between steps

LDI r4, 0
LDI r9, 0x2404
STORE r9, r4           ; ambient_wave = 0 (sine)

LDI r4, 0
LDI r9, 0x2408
STORE r9, r4           ; step_phase = 0 (left foot)

LDI r4, 0
LDI r9, 0x240C
STORE r9, r4           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r4, 0x000000
FILL r4                ; clear screen black

LDI r4, 0x00FF00
LDI r5, 80
LDI r13, 20
LDI r9, 0x2500
LDI r4, 83             ; 'S'
STORE r9, r4
ADD r9, r6
LDI r4, 70             ; 'F'
STORE r9, r4
ADD r9, r6
LDI r4, 88             ; 'X'
STORE r9, r4
ADD r9, r6
LDI r4, 95             ; '_'
STORE r9, r4
ADD r9, r6
LDI r4, 77             ; 'M'
STORE r9, r4
ADD r9, r6
LDI r4, 73             ; 'I'
STORE r9, r4
ADD r9, r6
LDI r4, 88             ; 'X'
STORE r9, r4
ADD r9, r6
LDI r4, 69             ; 'E'
STORE r9, r4
ADD r9, r6
LDI r4, 82             ; 'R'
STORE r9, r4
ADD r9, r6
LDI r4, 0              ; null terminator
STORE r9, r4
LDI r9, 0x2500
TEXT r5, r13, r9

; Instructions
LDI r9, 0x2520
LDI r4, 87
STORE r9, r4
ADD r9, r6
LDI r4, 47
STORE r9, r4
ADD r9, r6
LDI r4, 83
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 61
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 84
STORE r9, r4
ADD r9, r6
LDI r4, 69
STORE r9, r4
ADD r9, r6
LDI r4, 77
STORE r9, r4
ADD r9, r6
LDI r4, 80
STORE r9, r4
ADD r9, r6
LDI r4, 79
STORE r9, r4
ADD r9, r6
LDI r4, 0
STORE r9, r4
LDI r5, 80
LDI r13, 40
LDI r9, 0x2520
TEXT r5, r13, r9

; A/D line
LDI r9, 0x2540
LDI r4, 65
STORE r9, r4
ADD r9, r6
LDI r4, 47
STORE r9, r4
ADD r9, r6
LDI r4, 68
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 61
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 87
STORE r9, r4
ADD r9, r6
LDI r4, 65
STORE r9, r4
ADD r9, r6
LDI r4, 86
STORE r9, r4
ADD r9, r6
LDI r4, 69
STORE r9, r4
ADD r9, r6
LDI r4, 0
STORE r9, r4
LDI r5, 80
LDI r13, 50
LDI r9, 0x2540
TEXT r5, r13, r9

; Q line
LDI r9, 0x2560
LDI r4, 81
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 61
STORE r9, r4
ADD r9, r6
LDI r4, 32
STORE r9, r4
ADD r9, r6
LDI r4, 81
STORE r9, r4
ADD r9, r6
LDI r4, 85
STORE r9, r4
ADD r9, r6
LDI r4, 73
STORE r9, r4
ADD r9, r6
LDI r4, 84
STORE r9, r4
ADD r9, r6
LDI r4, 0
STORE r9, r4
LDI r5, 80
LDI r13, 60
LDI r9, 0x2560
TEXT r5, r13, r9

; ── Main Loop ──────────────────────────────────────────────────
LDI r6, 1              ; constant 1
LDI r7, 0xFFE          ; TICKS port
LDI r8, 0x2400         ; tempo addr
LDI r14, 0x2404        ; ambient_wave addr
LDI r15, 0x2408        ; step_phase addr
LDI r11, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r4, 0x000000
    FILL r4            ; clear screen

    ; Increment frame counter
    LDI r9, 0x240C
    LDI r4, 0
    LOAD r4, r9
    ADD r4, r6
    STORE r9, r4

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r3            ; r3 = key (0 if none)

    ; Q = quit
    LDI r4, 81
    CMP r3, r4
    JZ r0, do_quit

    ; W = increase tempo (decrease delay)
    LDI r4, 87
    CMP r3, r4
    JZ r0, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r4, 83
    CMP r3, r4
    JZ r0, tempo_down

    ; A = prev waveform
    LDI r4, 65
    CMP r3, r4
    JZ r0, wave_prev

    ; D = next waveform
    LDI r4, 68
    CMP r3, r4
    JZ r0, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r9, 0x2400
    LDI r4, 0
    LOAD r4, r9
    LDI r12, 5
    CMP r4, r12
    BLT r0, check_step  ; min tempo = 5
    LDI r12, 2
    SUB r4, r12
    STORE r9, r4
    JMP check_step

tempo_down:
    LDI r9, 0x2400
    LDI r4, 0
    LOAD r4, r9
    LDI r12, 60
    CMP r4, r12
    BGE r0, check_step  ; max tempo = 60
    LDI r12, 2
    ADD r4, r12
    STORE r9, r4
    JMP check_step

wave_prev:
    LDI r9, 0x2404
    LDI r4, 0
    LOAD r4, r9
    JZ r4, check_step  ; already at 0
    LDI r12, 1
    SUB r4, r12
    STORE r9, r4
    JMP check_step

wave_next:
    LDI r9, 0x2404
    LDI r4, 0
    LOAD r4, r9
    LDI r12, 3
    CMP r4, r12
    BGE r0, check_step ; max wave = 3 (sawtooth)
    LDI r12, 1
    ADD r4, r12
    STORE r9, r4
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r3, r7
    ; Read tempo
    LDI r9, 0x2400
    LDI r4, 0
    LOAD r4, r9
    ; ticks % tempo
    MOV r12, r3
    LDI r10, 0
    CMP r4, r10
    JZ r0, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r12 = ticks % tempo, check if 0
    JZ r12, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r9, 0x2408
    LDI r4, 0
    LOAD r4, r9         ; r4 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r4, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r4, 120
    LDI r12, 40
    BEEP r4, r12
    JMP toggle_phase

left_foot:
    LDI r4, 80
    LDI r12, 50
    BEEP r4, r12

toggle_phase:
    LDI r9, 0x2408
    LDI r4, 0
    LOAD r4, r9
    LDI r12, 1
    XOR r4, r12          ; toggle 0<->1
    STORE r9, r4

    ; Draw step indicator
    LDI r4, 0x2408
    LDI r10, 0
    LOAD r10, r4         ; r10 = phase
    LDI r4, 0xFF4444    ; red dot for left
    LDI r9, 0x44FF44    ; green dot for right
    JZ r10, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r3, r11       ; r3 = frame_counter
    LDI r4, 120
    CALL mod16          ; r12 = frame_counter % 120
    JZ r12, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r9, 0x2404
    LDI r4, 0
    LOAD r4, r9         ; r4 = waveform type

    LDI r12, 220         ; A3 = 220Hz
    LDI r10, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r4=wave, r12=freq, r10=dur already set
    NOTE r4, r12, r10

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r9, 0x2400
    LDI r4, 0
    LOAD r4, r9         ; r4 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r5, 20
    LDI r13, 100
    MOV r14, r4
    LDI r10, 3
    MUL r14, r10         ; r14 = tempo * 3 (bar width)
    LDI r15, 30         ; bar height
    LDI r8, 0x336699    ; steel blue
    RECTF r5, r13, r14, r15, r8

    ; Tempo label
    LDI r9, 0x2580
    LDI r4, 84
    STORE r9, r4
    ADD r9, r6
    LDI r4, 58
    STORE r9, r4
    ADD r9, r6
    LDI r4, 77
    STORE r9, r4
    ADD r9, r6
    LDI r4, 80
    STORE r9, r4
    ADD r9, r6
    LDI r4, 79
    STORE r9, r4
    ADD r9, r6
    LDI r4, 58
    STORE r9, r4
    ADD r9, r6
    LDI r4, 0
    STORE r9, r4
    LDI r5, 20
    LDI r13, 140
    LDI r9, 0x2580
    TEXT r5, r13, r9

    ; Waveform indicator
    LDI r9, 0x2404
    LDI r4, 0
    LOAD r4, r9         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r4, wave_sine
    LDI r12, 1
    CMP r4, r12
    JZ r0, wave_square
    LDI r12, 2
    CMP r4, r12
    JZ r0, wave_triangle
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

    ; ── Helper: mod16 (r12 = r3 % r4) ─────────────────────────
    ; r3 = dividend, r4 = divisor
    ; Returns r12 = remainder
    ; Clobbers r1, r2
mod16:
    PUSH r31
    PUSH r4
    PUSH r1
    PUSH r2
    MOV r12, r3
    MOV r1, r4          ; r1 = divisor
    LDI r2, 0           ; r2 = quotient
mod_loop:
    CMP r12, r1
    BLT r0, mod_done
    SUB r12, r1
    ADD r2, r6
    JMP mod_loop
mod_done:
    POP r2
    POP r1
    POP r4
    POP r31
    RET
