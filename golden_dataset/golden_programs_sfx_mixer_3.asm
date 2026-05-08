; DESCRIPTION: Render a red object at the screen.

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
LDI r12, 15
LDI r14, 0x2400
STORE r14, r12           ; tempo = 15 frames between steps

LDI r12, 0
LDI r14, 0x2404
STORE r14, r12           ; ambient_wave = 0 (sine)

LDI r12, 0
LDI r14, 0x2408
STORE r14, r12           ; step_phase = 0 (left foot)

LDI r12, 0
LDI r14, 0x240C
STORE r14, r12           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r12, 0x000000
FILL r12                ; clear screen black

LDI r12, 0x00FF00
LDI r4, 80
LDI r2, 20
LDI r14, 0x2500
LDI r12, 83             ; 'S'
STORE r14, r12
ADD r14, r7
LDI r12, 70             ; 'F'
STORE r14, r12
ADD r14, r7
LDI r12, 88             ; 'X'
STORE r14, r12
ADD r14, r7
LDI r12, 95             ; '_'
STORE r14, r12
ADD r14, r7
LDI r12, 77             ; 'M'
STORE r14, r12
ADD r14, r7
LDI r12, 73             ; 'I'
STORE r14, r12
ADD r14, r7
LDI r12, 88             ; 'X'
STORE r14, r12
ADD r14, r7
LDI r12, 69             ; 'E'
STORE r14, r12
ADD r14, r7
LDI r12, 82             ; 'R'
STORE r14, r12
ADD r14, r7
LDI r12, 0              ; null terminator
STORE r14, r12
LDI r14, 0x2500
TEXT r4, r2, r14

; Instructions
LDI r14, 0x2520
LDI r12, 87
STORE r14, r12
ADD r14, r7
LDI r12, 47
STORE r14, r12
ADD r14, r7
LDI r12, 83
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 61
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 84
STORE r14, r12
ADD r14, r7
LDI r12, 69
STORE r14, r12
ADD r14, r7
LDI r12, 77
STORE r14, r12
ADD r14, r7
LDI r12, 80
STORE r14, r12
ADD r14, r7
LDI r12, 79
STORE r14, r12
ADD r14, r7
LDI r12, 0
STORE r14, r12
LDI r4, 80
LDI r2, 40
LDI r14, 0x2520
TEXT r4, r2, r14

; A/D line
LDI r14, 0x2540
LDI r12, 65
STORE r14, r12
ADD r14, r7
LDI r12, 47
STORE r14, r12
ADD r14, r7
LDI r12, 68
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 61
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 87
STORE r14, r12
ADD r14, r7
LDI r12, 65
STORE r14, r12
ADD r14, r7
LDI r12, 86
STORE r14, r12
ADD r14, r7
LDI r12, 69
STORE r14, r12
ADD r14, r7
LDI r12, 0
STORE r14, r12
LDI r4, 80
LDI r2, 50
LDI r14, 0x2540
TEXT r4, r2, r14

; Q line
LDI r14, 0x2560
LDI r12, 81
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 61
STORE r14, r12
ADD r14, r7
LDI r12, 32
STORE r14, r12
ADD r14, r7
LDI r12, 81
STORE r14, r12
ADD r14, r7
LDI r12, 85
STORE r14, r12
ADD r14, r7
LDI r12, 73
STORE r14, r12
ADD r14, r7
LDI r12, 84
STORE r14, r12
ADD r14, r7
LDI r12, 0
STORE r14, r12
LDI r4, 80
LDI r2, 60
LDI r14, 0x2560
TEXT r4, r2, r14

; ── Main Loop ──────────────────────────────────────────────────
LDI r7, 1              ; constant 1
LDI r1, 0xFFE          ; TICKS port
LDI r10, 0x2400         ; tempo addr
LDI r3, 0x2404        ; ambient_wave addr
LDI r15, 0x2408        ; step_phase addr
LDI r13, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r12, 0x000000
    FILL r12            ; clear screen

    ; Increment frame counter
    LDI r14, 0x240C
    LDI r12, 0
    LOAD r12, r14
    ADD r12, r7
    STORE r14, r12

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r0            ; r0 = key (0 if none)

    ; Q = quit
    LDI r12, 81
    CMP r0, r12
    JZ r8, do_quit

    ; W = increase tempo (decrease delay)
    LDI r12, 87
    CMP r0, r12
    JZ r8, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r12, 83
    CMP r0, r12
    JZ r8, tempo_down

    ; A = prev waveform
    LDI r12, 65
    CMP r0, r12
    JZ r8, wave_prev

    ; D = next waveform
    LDI r12, 68
    CMP r0, r12
    JZ r8, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r14, 0x2400
    LDI r12, 0
    LOAD r12, r14
    LDI r11, 5
    CMP r12, r11
    BLT r8, check_step  ; min tempo = 5
    LDI r11, 2
    SUB r12, r11
    STORE r14, r12
    JMP check_step

tempo_down:
    LDI r14, 0x2400
    LDI r12, 0
    LOAD r12, r14
    LDI r11, 60
    CMP r12, r11
    BGE r8, check_step  ; max tempo = 60
    LDI r11, 2
    ADD r12, r11
    STORE r14, r12
    JMP check_step

wave_prev:
    LDI r14, 0x2404
    LDI r12, 0
    LOAD r12, r14
    JZ r12, check_step  ; already at 0
    LDI r11, 1
    SUB r12, r11
    STORE r14, r12
    JMP check_step

wave_next:
    LDI r14, 0x2404
    LDI r12, 0
    LOAD r12, r14
    LDI r11, 3
    CMP r12, r11
    BGE r8, check_step ; max wave = 3 (sawtooth)
    LDI r11, 1
    ADD r12, r11
    STORE r14, r12
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r0, r1
    ; Read tempo
    LDI r14, 0x2400
    LDI r12, 0
    LOAD r12, r14
    ; ticks % tempo
    MOV r11, r0
    LDI r5, 0
    CMP r12, r5
    JZ r8, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r11 = ticks % tempo, check if 0
    JZ r11, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r14, 0x2408
    LDI r12, 0
    LOAD r12, r14         ; r12 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r12, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r12, 120
    LDI r11, 40
    BEEP r12, r11
    JMP toggle_phase

left_foot:
    LDI r12, 80
    LDI r11, 50
    BEEP r12, r11

toggle_phase:
    LDI r14, 0x2408
    LDI r12, 0
    LOAD r12, r14
    LDI r11, 1
    XOR r12, r11          ; toggle 0<->1
    STORE r14, r12

    ; Draw step indicator
    LDI r12, 0x2408
    LDI r5, 0
    LOAD r5, r12         ; r5 = phase
    LDI r12, 0xFF4444    ; red dot for left
    LDI r14, 0x44FF44    ; green dot for right
    JZ r5, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r0, r13       ; r0 = frame_counter
    LDI r12, 120
    CALL mod16          ; r11 = frame_counter % 120
    JZ r11, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r14, 0x2404
    LDI r12, 0
    LOAD r12, r14         ; r12 = waveform type

    LDI r11, 220         ; A3 = 220Hz
    LDI r5, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r12=wave, r11=freq, r5=dur already set
    NOTE r12, r11, r5

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r14, 0x2400
    LDI r12, 0
    LOAD r12, r14         ; r12 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r4, 20
    LDI r2, 100
    MOV r3, r12
    LDI r5, 3
    MUL r3, r5         ; r3 = tempo * 3 (bar width)
    LDI r15, 30         ; bar height
    LDI r10, 0x336699    ; steel blue
    RECTF r4, r2, r3, r15, r10

    ; Tempo label
    LDI r14, 0x2580
    LDI r12, 84
    STORE r14, r12
    ADD r14, r7
    LDI r12, 58
    STORE r14, r12
    ADD r14, r7
    LDI r12, 77
    STORE r14, r12
    ADD r14, r7
    LDI r12, 80
    STORE r14, r12
    ADD r14, r7
    LDI r12, 79
    STORE r14, r12
    ADD r14, r7
    LDI r12, 58
    STORE r14, r12
    ADD r14, r7
    LDI r12, 0
    STORE r14, r12
    LDI r4, 20
    LDI r2, 140
    LDI r14, 0x2580
    TEXT r4, r2, r14

    ; Waveform indicator
    LDI r14, 0x2404
    LDI r12, 0
    LOAD r12, r14         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r12, wave_sine
    LDI r11, 1
    CMP r12, r11
    JZ r8, wave_square
    LDI r11, 2
    CMP r12, r11
    JZ r8, wave_triangle
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

    ; ── Helper: mod16 (r11 = r0 % r12) ─────────────────────────
    ; r0 = dividend, r12 = divisor
    ; Returns r11 = remainder
    ; Clobbers r9, r6
mod16:
    PUSH r31
    PUSH r12
    PUSH r9
    PUSH r6
    MOV r11, r0
    MOV r9, r12          ; r9 = divisor
    LDI r6, 0           ; r6 = quotient
mod_loop:
    CMP r11, r9
    BLT r8, mod_done
    SUB r11, r9
    ADD r6, r7
    JMP mod_loop
mod_done:
    POP r6
    POP r9
    POP r12
    POP r31
    RET
