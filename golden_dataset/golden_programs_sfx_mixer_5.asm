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
LDI r8, 15
LDI r1, 0x2400
STORE r1, r8           ; tempo = 15 frames between steps

LDI r8, 0
LDI r1, 0x2404
STORE r1, r8           ; ambient_wave = 0 (sine)

LDI r8, 0
LDI r1, 0x2408
STORE r1, r8           ; step_phase = 0 (left foot)

LDI r8, 0
LDI r1, 0x240C
STORE r1, r8           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r8, 0x000000
FILL r8                ; clear screen black

LDI r8, 0x00FF00
LDI r9, 80
LDI r11, 20
LDI r1, 0x2500
LDI r8, 83             ; 'S'
STORE r1, r8
ADD r1, r15
LDI r8, 70             ; 'F'
STORE r1, r8
ADD r1, r15
LDI r8, 88             ; 'X'
STORE r1, r8
ADD r1, r15
LDI r8, 95             ; '_'
STORE r1, r8
ADD r1, r15
LDI r8, 77             ; 'M'
STORE r1, r8
ADD r1, r15
LDI r8, 73             ; 'I'
STORE r1, r8
ADD r1, r15
LDI r8, 88             ; 'X'
STORE r1, r8
ADD r1, r15
LDI r8, 69             ; 'E'
STORE r1, r8
ADD r1, r15
LDI r8, 82             ; 'R'
STORE r1, r8
ADD r1, r15
LDI r8, 0              ; null terminator
STORE r1, r8
LDI r1, 0x2500
TEXT r9, r11, r1

; Instructions
LDI r1, 0x2520
LDI r8, 87
STORE r1, r8
ADD r1, r15
LDI r8, 47
STORE r1, r8
ADD r1, r15
LDI r8, 83
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 61
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 84
STORE r1, r8
ADD r1, r15
LDI r8, 69
STORE r1, r8
ADD r1, r15
LDI r8, 77
STORE r1, r8
ADD r1, r15
LDI r8, 80
STORE r1, r8
ADD r1, r15
LDI r8, 79
STORE r1, r8
ADD r1, r15
LDI r8, 0
STORE r1, r8
LDI r9, 80
LDI r11, 40
LDI r1, 0x2520
TEXT r9, r11, r1

; A/D line
LDI r1, 0x2540
LDI r8, 65
STORE r1, r8
ADD r1, r15
LDI r8, 47
STORE r1, r8
ADD r1, r15
LDI r8, 68
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 61
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 87
STORE r1, r8
ADD r1, r15
LDI r8, 65
STORE r1, r8
ADD r1, r15
LDI r8, 86
STORE r1, r8
ADD r1, r15
LDI r8, 69
STORE r1, r8
ADD r1, r15
LDI r8, 0
STORE r1, r8
LDI r9, 80
LDI r11, 50
LDI r1, 0x2540
TEXT r9, r11, r1

; Q line
LDI r1, 0x2560
LDI r8, 81
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 61
STORE r1, r8
ADD r1, r15
LDI r8, 32
STORE r1, r8
ADD r1, r15
LDI r8, 81
STORE r1, r8
ADD r1, r15
LDI r8, 85
STORE r1, r8
ADD r1, r15
LDI r8, 73
STORE r1, r8
ADD r1, r15
LDI r8, 84
STORE r1, r8
ADD r1, r15
LDI r8, 0
STORE r1, r8
LDI r9, 80
LDI r11, 60
LDI r1, 0x2560
TEXT r9, r11, r1

; ── Main Loop ──────────────────────────────────────────────────
LDI r15, 1              ; constant 1
LDI r6, 0xFFE          ; TICKS port
LDI r12, 0x2400         ; tempo addr
LDI r7, 0x2404        ; ambient_wave addr
LDI r5, 0x2408        ; step_phase addr
LDI r4, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r8, 0x000000
    FILL r8            ; clear screen

    ; Increment frame counter
    LDI r1, 0x240C
    LDI r8, 0
    LOAD r8, r1
    ADD r8, r15
    STORE r1, r8

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r10            ; r10 = key (0 if none)

    ; Q = quit
    LDI r8, 81
    CMP r10, r8
    JZ r0, do_quit

    ; W = increase tempo (decrease delay)
    LDI r8, 87
    CMP r10, r8
    JZ r0, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r8, 83
    CMP r10, r8
    JZ r0, tempo_down

    ; A = prev waveform
    LDI r8, 65
    CMP r10, r8
    JZ r0, wave_prev

    ; D = next waveform
    LDI r8, 68
    CMP r10, r8
    JZ r0, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r1, 0x2400
    LDI r8, 0
    LOAD r8, r1
    LDI r14, 5
    CMP r8, r14
    BLT r0, check_step  ; min tempo = 5
    LDI r14, 2
    SUB r8, r14
    STORE r1, r8
    JMP check_step

tempo_down:
    LDI r1, 0x2400
    LDI r8, 0
    LOAD r8, r1
    LDI r14, 60
    CMP r8, r14
    BGE r0, check_step  ; max tempo = 60
    LDI r14, 2
    ADD r8, r14
    STORE r1, r8
    JMP check_step

wave_prev:
    LDI r1, 0x2404
    LDI r8, 0
    LOAD r8, r1
    JZ r8, check_step  ; already at 0
    LDI r14, 1
    SUB r8, r14
    STORE r1, r8
    JMP check_step

wave_next:
    LDI r1, 0x2404
    LDI r8, 0
    LOAD r8, r1
    LDI r14, 3
    CMP r8, r14
    BGE r0, check_step ; max wave = 3 (sawtooth)
    LDI r14, 1
    ADD r8, r14
    STORE r1, r8
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r10, r6
    ; Read tempo
    LDI r1, 0x2400
    LDI r8, 0
    LOAD r8, r1
    ; ticks % tempo
    MOV r14, r10
    LDI r2, 0
    CMP r8, r2
    JZ r0, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r14 = ticks % tempo, check if 0
    JZ r14, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r1, 0x2408
    LDI r8, 0
    LOAD r8, r1         ; r8 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r8, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r8, 120
    LDI r14, 40
    BEEP r8, r14
    JMP toggle_phase

left_foot:
    LDI r8, 80
    LDI r14, 50
    BEEP r8, r14

toggle_phase:
    LDI r1, 0x2408
    LDI r8, 0
    LOAD r8, r1
    LDI r14, 1
    XOR r8, r14          ; toggle 0<->1
    STORE r1, r8

    ; Draw step indicator
    LDI r8, 0x2408
    LDI r2, 0
    LOAD r2, r8         ; r2 = phase
    LDI r8, 0xFF4444    ; red dot for left
    LDI r1, 0x44FF44    ; green dot for right
    JZ r2, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r10, r4       ; r10 = frame_counter
    LDI r8, 120
    CALL mod16          ; r14 = frame_counter % 120
    JZ r14, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r1, 0x2404
    LDI r8, 0
    LOAD r8, r1         ; r8 = waveform type

    LDI r14, 220         ; A3 = 220Hz
    LDI r2, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r8=wave, r14=freq, r2=dur already set
    NOTE r8, r14, r2

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r1, 0x2400
    LDI r8, 0
    LOAD r8, r1         ; r8 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r9, 20
    LDI r11, 100
    MOV r7, r8
    LDI r2, 3
    MUL r7, r2         ; r7 = tempo * 3 (bar width)
    LDI r5, 30         ; bar height
    LDI r12, 0x336699    ; steel blue
    RECTF r9, r11, r7, r5, r12

    ; Tempo label
    LDI r1, 0x2580
    LDI r8, 84
    STORE r1, r8
    ADD r1, r15
    LDI r8, 58
    STORE r1, r8
    ADD r1, r15
    LDI r8, 77
    STORE r1, r8
    ADD r1, r15
    LDI r8, 80
    STORE r1, r8
    ADD r1, r15
    LDI r8, 79
    STORE r1, r8
    ADD r1, r15
    LDI r8, 58
    STORE r1, r8
    ADD r1, r15
    LDI r8, 0
    STORE r1, r8
    LDI r9, 20
    LDI r11, 140
    LDI r1, 0x2580
    TEXT r9, r11, r1

    ; Waveform indicator
    LDI r1, 0x2404
    LDI r8, 0
    LOAD r8, r1         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r8, wave_sine
    LDI r14, 1
    CMP r8, r14
    JZ r0, wave_square
    LDI r14, 2
    CMP r8, r14
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

    ; ── Helper: mod16 (r14 = r10 % r8) ─────────────────────────
    ; r10 = dividend, r8 = divisor
    ; Returns r14 = remainder
    ; Clobbers r3, r13
mod16:
    PUSH r31
    PUSH r8
    PUSH r3
    PUSH r13
    MOV r14, r10
    MOV r3, r8          ; r3 = divisor
    LDI r13, 0           ; r13 = quotient
mod_loop:
    CMP r14, r3
    BLT r0, mod_done
    SUB r14, r3
    ADD r13, r15
    JMP mod_loop
mod_done:
    POP r13
    POP r3
    POP r8
    POP r31
    RET
