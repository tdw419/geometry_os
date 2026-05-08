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
LDI r3, 15
LDI r0, 0x2400
STORE r0, r3           ; tempo = 15 frames between steps

LDI r3, 0
LDI r0, 0x2404
STORE r0, r3           ; ambient_wave = 0 (sine)

LDI r3, 0
LDI r0, 0x2408
STORE r0, r3           ; step_phase = 0 (left foot)

LDI r3, 0
LDI r0, 0x240C
STORE r0, r3           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r3, 0x000000
FILL r3                ; clear screen black

LDI r3, 0x00FF00
LDI r13, 80
LDI r15, 20
LDI r0, 0x2500
LDI r3, 83             ; 'S'
STORE r0, r3
ADD r0, r10
LDI r3, 70             ; 'F'
STORE r0, r3
ADD r0, r10
LDI r3, 88             ; 'X'
STORE r0, r3
ADD r0, r10
LDI r3, 95             ; '_'
STORE r0, r3
ADD r0, r10
LDI r3, 77             ; 'M'
STORE r0, r3
ADD r0, r10
LDI r3, 73             ; 'I'
STORE r0, r3
ADD r0, r10
LDI r3, 88             ; 'X'
STORE r0, r3
ADD r0, r10
LDI r3, 69             ; 'E'
STORE r0, r3
ADD r0, r10
LDI r3, 82             ; 'R'
STORE r0, r3
ADD r0, r10
LDI r3, 0              ; null terminator
STORE r0, r3
LDI r0, 0x2500
TEXT r13, r15, r0

; Instructions
LDI r0, 0x2520
LDI r3, 87
STORE r0, r3
ADD r0, r10
LDI r3, 47
STORE r0, r3
ADD r0, r10
LDI r3, 83
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 61
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 84
STORE r0, r3
ADD r0, r10
LDI r3, 69
STORE r0, r3
ADD r0, r10
LDI r3, 77
STORE r0, r3
ADD r0, r10
LDI r3, 80
STORE r0, r3
ADD r0, r10
LDI r3, 79
STORE r0, r3
ADD r0, r10
LDI r3, 0
STORE r0, r3
LDI r13, 80
LDI r15, 40
LDI r0, 0x2520
TEXT r13, r15, r0

; A/D line
LDI r0, 0x2540
LDI r3, 65
STORE r0, r3
ADD r0, r10
LDI r3, 47
STORE r0, r3
ADD r0, r10
LDI r3, 68
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 61
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 87
STORE r0, r3
ADD r0, r10
LDI r3, 65
STORE r0, r3
ADD r0, r10
LDI r3, 86
STORE r0, r3
ADD r0, r10
LDI r3, 69
STORE r0, r3
ADD r0, r10
LDI r3, 0
STORE r0, r3
LDI r13, 80
LDI r15, 50
LDI r0, 0x2540
TEXT r13, r15, r0

; Q line
LDI r0, 0x2560
LDI r3, 81
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 61
STORE r0, r3
ADD r0, r10
LDI r3, 32
STORE r0, r3
ADD r0, r10
LDI r3, 81
STORE r0, r3
ADD r0, r10
LDI r3, 85
STORE r0, r3
ADD r0, r10
LDI r3, 73
STORE r0, r3
ADD r0, r10
LDI r3, 84
STORE r0, r3
ADD r0, r10
LDI r3, 0
STORE r0, r3
LDI r13, 80
LDI r15, 60
LDI r0, 0x2560
TEXT r13, r15, r0

; ── Main Loop ──────────────────────────────────────────────────
LDI r10, 1              ; constant 1
LDI r2, 0xFFE          ; TICKS port
LDI r9, 0x2400         ; tempo addr
LDI r8, 0x2404        ; ambient_wave addr
LDI r1, 0x2408        ; step_phase addr
LDI r12, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r3, 0x000000
    FILL r3            ; clear screen

    ; Increment frame counter
    LDI r0, 0x240C
    LDI r3, 0
    LOAD r3, r0
    ADD r3, r10
    STORE r0, r3

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r11            ; r11 = key (0 if none)

    ; Q = quit
    LDI r3, 81
    CMP r11, r3
    JZ r4, do_quit

    ; W = increase tempo (decrease delay)
    LDI r3, 87
    CMP r11, r3
    JZ r4, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r3, 83
    CMP r11, r3
    JZ r4, tempo_down

    ; A = prev waveform
    LDI r3, 65
    CMP r11, r3
    JZ r4, wave_prev

    ; D = next waveform
    LDI r3, 68
    CMP r11, r3
    JZ r4, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r0, 0x2400
    LDI r3, 0
    LOAD r3, r0
    LDI r5, 5
    CMP r3, r5
    BLT r4, check_step  ; min tempo = 5
    LDI r5, 2
    SUB r3, r5
    STORE r0, r3
    JMP check_step

tempo_down:
    LDI r0, 0x2400
    LDI r3, 0
    LOAD r3, r0
    LDI r5, 60
    CMP r3, r5
    BGE r4, check_step  ; max tempo = 60
    LDI r5, 2
    ADD r3, r5
    STORE r0, r3
    JMP check_step

wave_prev:
    LDI r0, 0x2404
    LDI r3, 0
    LOAD r3, r0
    JZ r3, check_step  ; already at 0
    LDI r5, 1
    SUB r3, r5
    STORE r0, r3
    JMP check_step

wave_next:
    LDI r0, 0x2404
    LDI r3, 0
    LOAD r3, r0
    LDI r5, 3
    CMP r3, r5
    BGE r4, check_step ; max wave = 3 (sawtooth)
    LDI r5, 1
    ADD r3, r5
    STORE r0, r3
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r11, r2
    ; Read tempo
    LDI r0, 0x2400
    LDI r3, 0
    LOAD r3, r0
    ; ticks % tempo
    MOV r5, r11
    LDI r14, 0
    CMP r3, r14
    JZ r4, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r5 = ticks % tempo, check if 0
    JZ r5, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r0, 0x2408
    LDI r3, 0
    LOAD r3, r0         ; r3 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r3, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r3, 120
    LDI r5, 40
    BEEP r3, r5
    JMP toggle_phase

left_foot:
    LDI r3, 80
    LDI r5, 50
    BEEP r3, r5

toggle_phase:
    LDI r0, 0x2408
    LDI r3, 0
    LOAD r3, r0
    LDI r5, 1
    XOR r3, r5          ; toggle 0<->1
    STORE r0, r3

    ; Draw step indicator
    LDI r3, 0x2408
    LDI r14, 0
    LOAD r14, r3         ; r14 = phase
    LDI r3, 0xFF4444    ; red dot for left
    LDI r0, 0x44FF44    ; green dot for right
    JZ r14, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r11, r12       ; r11 = frame_counter
    LDI r3, 120
    CALL mod16          ; r5 = frame_counter % 120
    JZ r5, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r0, 0x2404
    LDI r3, 0
    LOAD r3, r0         ; r3 = waveform type

    LDI r5, 220         ; A3 = 220Hz
    LDI r14, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r3=wave, r5=freq, r14=dur already set
    NOTE r3, r5, r14

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r0, 0x2400
    LDI r3, 0
    LOAD r3, r0         ; r3 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r13, 20
    LDI r15, 100
    MOV r8, r3
    LDI r14, 3
    MUL r8, r14         ; r8 = tempo * 3 (bar width)
    LDI r1, 30         ; bar height
    LDI r9, 0x336699    ; steel blue
    RECTF r13, r15, r8, r1, r9

    ; Tempo label
    LDI r0, 0x2580
    LDI r3, 84
    STORE r0, r3
    ADD r0, r10
    LDI r3, 58
    STORE r0, r3
    ADD r0, r10
    LDI r3, 77
    STORE r0, r3
    ADD r0, r10
    LDI r3, 80
    STORE r0, r3
    ADD r0, r10
    LDI r3, 79
    STORE r0, r3
    ADD r0, r10
    LDI r3, 58
    STORE r0, r3
    ADD r0, r10
    LDI r3, 0
    STORE r0, r3
    LDI r13, 20
    LDI r15, 140
    LDI r0, 0x2580
    TEXT r13, r15, r0

    ; Waveform indicator
    LDI r0, 0x2404
    LDI r3, 0
    LOAD r3, r0         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r3, wave_sine
    LDI r5, 1
    CMP r3, r5
    JZ r4, wave_square
    LDI r5, 2
    CMP r3, r5
    JZ r4, wave_triangle
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

    ; ── Helper: mod16 (r5 = r11 % r3) ─────────────────────────
    ; r11 = dividend, r3 = divisor
    ; Returns r5 = remainder
    ; Clobbers r7, r6
mod16:
    PUSH r31
    PUSH r3
    PUSH r7
    PUSH r6
    MOV r5, r11
    MOV r7, r3          ; r7 = divisor
    LDI r6, 0           ; r6 = quotient
mod_loop:
    CMP r5, r7
    BLT r4, mod_done
    SUB r5, r7
    ADD r6, r10
    JMP mod_loop
mod_done:
    POP r6
    POP r7
    POP r3
    POP r31
    RET
