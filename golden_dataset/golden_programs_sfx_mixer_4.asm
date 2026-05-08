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
LDI r11, 15
LDI r10, 0x2400
STORE r10, r11           ; tempo = 15 frames between steps

LDI r11, 0
LDI r10, 0x2404
STORE r10, r11           ; ambient_wave = 0 (sine)

LDI r11, 0
LDI r10, 0x2408
STORE r10, r11           ; step_phase = 0 (left foot)

LDI r11, 0
LDI r10, 0x240C
STORE r10, r11           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r11, 0x000000
FILL r11                ; clear screen black

LDI r11, 0x00FF00
LDI r5, 80
LDI r0, 20
LDI r10, 0x2500
LDI r11, 83             ; 'S'
STORE r10, r11
ADD r10, r13
LDI r11, 70             ; 'F'
STORE r10, r11
ADD r10, r13
LDI r11, 88             ; 'X'
STORE r10, r11
ADD r10, r13
LDI r11, 95             ; '_'
STORE r10, r11
ADD r10, r13
LDI r11, 77             ; 'M'
STORE r10, r11
ADD r10, r13
LDI r11, 73             ; 'I'
STORE r10, r11
ADD r10, r13
LDI r11, 88             ; 'X'
STORE r10, r11
ADD r10, r13
LDI r11, 69             ; 'E'
STORE r10, r11
ADD r10, r13
LDI r11, 82             ; 'R'
STORE r10, r11
ADD r10, r13
LDI r11, 0              ; null terminator
STORE r10, r11
LDI r10, 0x2500
TEXT r5, r0, r10

; Instructions
LDI r10, 0x2520
LDI r11, 87
STORE r10, r11
ADD r10, r13
LDI r11, 47
STORE r10, r11
ADD r10, r13
LDI r11, 83
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 61
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 84
STORE r10, r11
ADD r10, r13
LDI r11, 69
STORE r10, r11
ADD r10, r13
LDI r11, 77
STORE r10, r11
ADD r10, r13
LDI r11, 80
STORE r10, r11
ADD r10, r13
LDI r11, 79
STORE r10, r11
ADD r10, r13
LDI r11, 0
STORE r10, r11
LDI r5, 80
LDI r0, 40
LDI r10, 0x2520
TEXT r5, r0, r10

; A/D line
LDI r10, 0x2540
LDI r11, 65
STORE r10, r11
ADD r10, r13
LDI r11, 47
STORE r10, r11
ADD r10, r13
LDI r11, 68
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 61
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 87
STORE r10, r11
ADD r10, r13
LDI r11, 65
STORE r10, r11
ADD r10, r13
LDI r11, 86
STORE r10, r11
ADD r10, r13
LDI r11, 69
STORE r10, r11
ADD r10, r13
LDI r11, 0
STORE r10, r11
LDI r5, 80
LDI r0, 50
LDI r10, 0x2540
TEXT r5, r0, r10

; Q line
LDI r10, 0x2560
LDI r11, 81
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 61
STORE r10, r11
ADD r10, r13
LDI r11, 32
STORE r10, r11
ADD r10, r13
LDI r11, 81
STORE r10, r11
ADD r10, r13
LDI r11, 85
STORE r10, r11
ADD r10, r13
LDI r11, 73
STORE r10, r11
ADD r10, r13
LDI r11, 84
STORE r10, r11
ADD r10, r13
LDI r11, 0
STORE r10, r11
LDI r5, 80
LDI r0, 60
LDI r10, 0x2560
TEXT r5, r0, r10

; ── Main Loop ──────────────────────────────────────────────────
LDI r13, 1              ; constant 1
LDI r2, 0xFFE          ; TICKS port
LDI r7, 0x2400         ; tempo addr
LDI r15, 0x2404        ; ambient_wave addr
LDI r14, 0x2408        ; step_phase addr
LDI r4, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r11, 0x000000
    FILL r11            ; clear screen

    ; Increment frame counter
    LDI r10, 0x240C
    LDI r11, 0
    LOAD r11, r10
    ADD r11, r13
    STORE r10, r11

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r3            ; r3 = key (0 if none)

    ; Q = quit
    LDI r11, 81
    CMP r3, r11
    JZ r1, do_quit

    ; W = increase tempo (decrease delay)
    LDI r11, 87
    CMP r3, r11
    JZ r1, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r11, 83
    CMP r3, r11
    JZ r1, tempo_down

    ; A = prev waveform
    LDI r11, 65
    CMP r3, r11
    JZ r1, wave_prev

    ; D = next waveform
    LDI r11, 68
    CMP r3, r11
    JZ r1, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r10, 0x2400
    LDI r11, 0
    LOAD r11, r10
    LDI r12, 5
    CMP r11, r12
    BLT r1, check_step  ; min tempo = 5
    LDI r12, 2
    SUB r11, r12
    STORE r10, r11
    JMP check_step

tempo_down:
    LDI r10, 0x2400
    LDI r11, 0
    LOAD r11, r10
    LDI r12, 60
    CMP r11, r12
    BGE r1, check_step  ; max tempo = 60
    LDI r12, 2
    ADD r11, r12
    STORE r10, r11
    JMP check_step

wave_prev:
    LDI r10, 0x2404
    LDI r11, 0
    LOAD r11, r10
    JZ r11, check_step  ; already at 0
    LDI r12, 1
    SUB r11, r12
    STORE r10, r11
    JMP check_step

wave_next:
    LDI r10, 0x2404
    LDI r11, 0
    LOAD r11, r10
    LDI r12, 3
    CMP r11, r12
    BGE r1, check_step ; max wave = 3 (sawtooth)
    LDI r12, 1
    ADD r11, r12
    STORE r10, r11
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r3, r2
    ; Read tempo
    LDI r10, 0x2400
    LDI r11, 0
    LOAD r11, r10
    ; ticks % tempo
    MOV r12, r3
    LDI r9, 0
    CMP r11, r9
    JZ r1, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r12 = ticks % tempo, check if 0
    JZ r12, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r10, 0x2408
    LDI r11, 0
    LOAD r11, r10         ; r11 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r11, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r11, 120
    LDI r12, 40
    BEEP r11, r12
    JMP toggle_phase

left_foot:
    LDI r11, 80
    LDI r12, 50
    BEEP r11, r12

toggle_phase:
    LDI r10, 0x2408
    LDI r11, 0
    LOAD r11, r10
    LDI r12, 1
    XOR r11, r12          ; toggle 0<->1
    STORE r10, r11

    ; Draw step indicator
    LDI r11, 0x2408
    LDI r9, 0
    LOAD r9, r11         ; r9 = phase
    LDI r11, 0xFF4444    ; red dot for left
    LDI r10, 0x44FF44    ; green dot for right
    JZ r9, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r3, r4       ; r3 = frame_counter
    LDI r11, 120
    CALL mod16          ; r12 = frame_counter % 120
    JZ r12, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r10, 0x2404
    LDI r11, 0
    LOAD r11, r10         ; r11 = waveform type

    LDI r12, 220         ; A3 = 220Hz
    LDI r9, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r11=wave, r12=freq, r9=dur already set
    NOTE r11, r12, r9

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r10, 0x2400
    LDI r11, 0
    LOAD r11, r10         ; r11 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r5, 20
    LDI r0, 100
    MOV r15, r11
    LDI r9, 3
    MUL r15, r9         ; r15 = tempo * 3 (bar width)
    LDI r14, 30         ; bar height
    LDI r7, 0x336699    ; steel blue
    RECTF r5, r0, r15, r14, r7

    ; Tempo label
    LDI r10, 0x2580
    LDI r11, 84
    STORE r10, r11
    ADD r10, r13
    LDI r11, 58
    STORE r10, r11
    ADD r10, r13
    LDI r11, 77
    STORE r10, r11
    ADD r10, r13
    LDI r11, 80
    STORE r10, r11
    ADD r10, r13
    LDI r11, 79
    STORE r10, r11
    ADD r10, r13
    LDI r11, 58
    STORE r10, r11
    ADD r10, r13
    LDI r11, 0
    STORE r10, r11
    LDI r5, 20
    LDI r0, 140
    LDI r10, 0x2580
    TEXT r5, r0, r10

    ; Waveform indicator
    LDI r10, 0x2404
    LDI r11, 0
    LOAD r11, r10         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r11, wave_sine
    LDI r12, 1
    CMP r11, r12
    JZ r1, wave_square
    LDI r12, 2
    CMP r11, r12
    JZ r1, wave_triangle
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

    ; ── Helper: mod16 (r12 = r3 % r11) ─────────────────────────
    ; r3 = dividend, r11 = divisor
    ; Returns r12 = remainder
    ; Clobbers r8, r6
mod16:
    PUSH r31
    PUSH r11
    PUSH r8
    PUSH r6
    MOV r12, r3
    MOV r8, r11          ; r8 = divisor
    LDI r6, 0           ; r6 = quotient
mod_loop:
    CMP r12, r8
    BLT r1, mod_done
    SUB r12, r8
    ADD r6, r13
    JMP mod_loop
mod_done:
    POP r6
    POP r8
    POP r11
    POP r31
    RET
