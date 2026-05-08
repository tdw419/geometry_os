; DESCRIPTION: Draws a red object at the screen with fixed size.

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
LDI r15, 15
LDI r8, 0x2400
STORE r8, r15           ; tempo = 15 frames between steps

LDI r15, 0
LDI r8, 0x2404
STORE r8, r15           ; ambient_wave = 0 (sine)

LDI r15, 0
LDI r8, 0x2408
STORE r8, r15           ; step_phase = 0 (left foot)

LDI r15, 0
LDI r8, 0x240C
STORE r8, r15           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r15, 0x000000
FILL r15                ; clear screen black

LDI r15, 0x00FF00
LDI r11, 80
LDI r13, 20
LDI r8, 0x2500
LDI r15, 83             ; 'S'
STORE r8, r15
ADD r8, r12
LDI r15, 70             ; 'F'
STORE r8, r15
ADD r8, r12
LDI r15, 88             ; 'X'
STORE r8, r15
ADD r8, r12
LDI r15, 95             ; '_'
STORE r8, r15
ADD r8, r12
LDI r15, 77             ; 'M'
STORE r8, r15
ADD r8, r12
LDI r15, 73             ; 'I'
STORE r8, r15
ADD r8, r12
LDI r15, 88             ; 'X'
STORE r8, r15
ADD r8, r12
LDI r15, 69             ; 'E'
STORE r8, r15
ADD r8, r12
LDI r15, 82             ; 'R'
STORE r8, r15
ADD r8, r12
LDI r15, 0              ; null terminator
STORE r8, r15
LDI r8, 0x2500
TEXT r11, r13, r8

; Instructions
LDI r8, 0x2520
LDI r15, 87
STORE r8, r15
ADD r8, r12
LDI r15, 47
STORE r8, r15
ADD r8, r12
LDI r15, 83
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 61
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 84
STORE r8, r15
ADD r8, r12
LDI r15, 69
STORE r8, r15
ADD r8, r12
LDI r15, 77
STORE r8, r15
ADD r8, r12
LDI r15, 80
STORE r8, r15
ADD r8, r12
LDI r15, 79
STORE r8, r15
ADD r8, r12
LDI r15, 0
STORE r8, r15
LDI r11, 80
LDI r13, 40
LDI r8, 0x2520
TEXT r11, r13, r8

; A/D line
LDI r8, 0x2540
LDI r15, 65
STORE r8, r15
ADD r8, r12
LDI r15, 47
STORE r8, r15
ADD r8, r12
LDI r15, 68
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 61
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 87
STORE r8, r15
ADD r8, r12
LDI r15, 65
STORE r8, r15
ADD r8, r12
LDI r15, 86
STORE r8, r15
ADD r8, r12
LDI r15, 69
STORE r8, r15
ADD r8, r12
LDI r15, 0
STORE r8, r15
LDI r11, 80
LDI r13, 50
LDI r8, 0x2540
TEXT r11, r13, r8

; Q line
LDI r8, 0x2560
LDI r15, 81
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 61
STORE r8, r15
ADD r8, r12
LDI r15, 32
STORE r8, r15
ADD r8, r12
LDI r15, 81
STORE r8, r15
ADD r8, r12
LDI r15, 85
STORE r8, r15
ADD r8, r12
LDI r15, 73
STORE r8, r15
ADD r8, r12
LDI r15, 84
STORE r8, r15
ADD r8, r12
LDI r15, 0
STORE r8, r15
LDI r11, 80
LDI r13, 60
LDI r8, 0x2560
TEXT r11, r13, r8

; ── Main Loop ──────────────────────────────────────────────────
LDI r12, 1              ; constant 1
LDI r5, 0xFFE          ; TICKS port
LDI r2, 0x2400         ; tempo addr
LDI r4, 0x2404        ; ambient_wave addr
LDI r14, 0x2408        ; step_phase addr
LDI r9, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r15, 0x000000
    FILL r15            ; clear screen

    ; Increment frame counter
    LDI r8, 0x240C
    LDI r15, 0
    LOAD r15, r8
    ADD r15, r12
    STORE r8, r15

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r0            ; r0 = key (0 if none)

    ; Q = quit
    LDI r15, 81
    CMP r0, r15
    JZ r7, do_quit

    ; W = increase tempo (decrease delay)
    LDI r15, 87
    CMP r0, r15
    JZ r7, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r15, 83
    CMP r0, r15
    JZ r7, tempo_down

    ; A = prev waveform
    LDI r15, 65
    CMP r0, r15
    JZ r7, wave_prev

    ; D = next waveform
    LDI r15, 68
    CMP r0, r15
    JZ r7, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r8, 0x2400
    LDI r15, 0
    LOAD r15, r8
    LDI r1, 5
    CMP r15, r1
    BLT r7, check_step  ; min tempo = 5
    LDI r1, 2
    SUB r15, r1
    STORE r8, r15
    JMP check_step

tempo_down:
    LDI r8, 0x2400
    LDI r15, 0
    LOAD r15, r8
    LDI r1, 60
    CMP r15, r1
    BGE r7, check_step  ; max tempo = 60
    LDI r1, 2
    ADD r15, r1
    STORE r8, r15
    JMP check_step

wave_prev:
    LDI r8, 0x2404
    LDI r15, 0
    LOAD r15, r8
    JZ r15, check_step  ; already at 0
    LDI r1, 1
    SUB r15, r1
    STORE r8, r15
    JMP check_step

wave_next:
    LDI r8, 0x2404
    LDI r15, 0
    LOAD r15, r8
    LDI r1, 3
    CMP r15, r1
    BGE r7, check_step ; max wave = 3 (sawtooth)
    LDI r1, 1
    ADD r15, r1
    STORE r8, r15
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r0, r5
    ; Read tempo
    LDI r8, 0x2400
    LDI r15, 0
    LOAD r15, r8
    ; ticks % tempo
    MOV r1, r0
    LDI r10, 0
    CMP r15, r10
    JZ r7, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r1 = ticks % tempo, check if 0
    JZ r1, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r8, 0x2408
    LDI r15, 0
    LOAD r15, r8         ; r15 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r15, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r15, 120
    LDI r1, 40
    BEEP r15, r1
    JMP toggle_phase

left_foot:
    LDI r15, 80
    LDI r1, 50
    BEEP r15, r1

toggle_phase:
    LDI r8, 0x2408
    LDI r15, 0
    LOAD r15, r8
    LDI r1, 1
    XOR r15, r1          ; toggle 0<->1
    STORE r8, r15

    ; Draw step indicator
    LDI r15, 0x2408
    LDI r10, 0
    LOAD r10, r15         ; r10 = phase
    LDI r15, 0xFF4444    ; red dot for left
    LDI r8, 0x44FF44    ; green dot for right
    JZ r10, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r0, r9       ; r0 = frame_counter
    LDI r15, 120
    CALL mod16          ; r1 = frame_counter % 120
    JZ r1, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r8, 0x2404
    LDI r15, 0
    LOAD r15, r8         ; r15 = waveform type

    LDI r1, 220         ; A3 = 220Hz
    LDI r10, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r15=wave, r1=freq, r10=dur already set
    NOTE r15, r1, r10

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r8, 0x2400
    LDI r15, 0
    LOAD r15, r8         ; r15 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r11, 20
    LDI r13, 100
    MOV r4, r15
    LDI r10, 3
    MUL r4, r10         ; r4 = tempo * 3 (bar width)
    LDI r14, 30         ; bar height
    LDI r2, 0x336699    ; steel blue
    RECTF r11, r13, r4, r14, r2

    ; Tempo label
    LDI r8, 0x2580
    LDI r15, 84
    STORE r8, r15
    ADD r8, r12
    LDI r15, 58
    STORE r8, r15
    ADD r8, r12
    LDI r15, 77
    STORE r8, r15
    ADD r8, r12
    LDI r15, 80
    STORE r8, r15
    ADD r8, r12
    LDI r15, 79
    STORE r8, r15
    ADD r8, r12
    LDI r15, 58
    STORE r8, r15
    ADD r8, r12
    LDI r15, 0
    STORE r8, r15
    LDI r11, 20
    LDI r13, 140
    LDI r8, 0x2580
    TEXT r11, r13, r8

    ; Waveform indicator
    LDI r8, 0x2404
    LDI r15, 0
    LOAD r15, r8         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r15, wave_sine
    LDI r1, 1
    CMP r15, r1
    JZ r7, wave_square
    LDI r1, 2
    CMP r15, r1
    JZ r7, wave_triangle
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

    ; ── Helper: mod16 (r1 = r0 % r15) ─────────────────────────
    ; r0 = dividend, r15 = divisor
    ; Returns r1 = remainder
    ; Clobbers r3, r6
mod16:
    PUSH r31
    PUSH r15
    PUSH r3
    PUSH r6
    MOV r1, r0
    MOV r3, r15          ; r3 = divisor
    LDI r6, 0           ; r6 = quotient
mod_loop:
    CMP r1, r3
    BLT r7, mod_done
    SUB r1, r3
    ADD r6, r12
    JMP mod_loop
mod_done:
    POP r6
    POP r3
    POP r15
    POP r31
    RET
