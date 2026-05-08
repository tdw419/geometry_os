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
LDI r0, 0x2400
STORE r0, r2           ; tempo = 15 frames between steps

LDI r2, 0
LDI r0, 0x2404
STORE r0, r2           ; ambient_wave = 0 (sine)

LDI r2, 0
LDI r0, 0x2408
STORE r0, r2           ; step_phase = 0 (left foot)

LDI r2, 0
LDI r0, 0x240C
STORE r0, r2           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r2, 0x000000
FILL r2                ; clear screen black

LDI r2, 0x00FF00
LDI r6, 80
LDI r8, 20
LDI r0, 0x2500
LDI r2, 83             ; 'S'
STORE r0, r2
ADD r0, r9
LDI r2, 70             ; 'F'
STORE r0, r2
ADD r0, r9
LDI r2, 88             ; 'X'
STORE r0, r2
ADD r0, r9
LDI r2, 95             ; '_'
STORE r0, r2
ADD r0, r9
LDI r2, 77             ; 'M'
STORE r0, r2
ADD r0, r9
LDI r2, 73             ; 'I'
STORE r0, r2
ADD r0, r9
LDI r2, 88             ; 'X'
STORE r0, r2
ADD r0, r9
LDI r2, 69             ; 'E'
STORE r0, r2
ADD r0, r9
LDI r2, 82             ; 'R'
STORE r0, r2
ADD r0, r9
LDI r2, 0              ; null terminator
STORE r0, r2
LDI r0, 0x2500
TEXT r6, r8, r0

; Instructions
LDI r0, 0x2520
LDI r2, 87
STORE r0, r2
ADD r0, r9
LDI r2, 47
STORE r0, r2
ADD r0, r9
LDI r2, 83
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 61
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 84
STORE r0, r2
ADD r0, r9
LDI r2, 69
STORE r0, r2
ADD r0, r9
LDI r2, 77
STORE r0, r2
ADD r0, r9
LDI r2, 80
STORE r0, r2
ADD r0, r9
LDI r2, 79
STORE r0, r2
ADD r0, r9
LDI r2, 0
STORE r0, r2
LDI r6, 80
LDI r8, 40
LDI r0, 0x2520
TEXT r6, r8, r0

; A/D line
LDI r0, 0x2540
LDI r2, 65
STORE r0, r2
ADD r0, r9
LDI r2, 47
STORE r0, r2
ADD r0, r9
LDI r2, 68
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 61
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 87
STORE r0, r2
ADD r0, r9
LDI r2, 65
STORE r0, r2
ADD r0, r9
LDI r2, 86
STORE r0, r2
ADD r0, r9
LDI r2, 69
STORE r0, r2
ADD r0, r9
LDI r2, 0
STORE r0, r2
LDI r6, 80
LDI r8, 50
LDI r0, 0x2540
TEXT r6, r8, r0

; Q line
LDI r0, 0x2560
LDI r2, 81
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 61
STORE r0, r2
ADD r0, r9
LDI r2, 32
STORE r0, r2
ADD r0, r9
LDI r2, 81
STORE r0, r2
ADD r0, r9
LDI r2, 85
STORE r0, r2
ADD r0, r9
LDI r2, 73
STORE r0, r2
ADD r0, r9
LDI r2, 84
STORE r0, r2
ADD r0, r9
LDI r2, 0
STORE r0, r2
LDI r6, 80
LDI r8, 60
LDI r0, 0x2560
TEXT r6, r8, r0

; ── Main Loop ──────────────────────────────────────────────────
LDI r9, 1              ; constant 1
LDI r5, 0xFFE          ; TICKS port
LDI r3, 0x2400         ; tempo addr
LDI r13, 0x2404        ; ambient_wave addr
LDI r14, 0x2408        ; step_phase addr
LDI r15, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r2, 0x000000
    FILL r2            ; clear screen

    ; Increment frame counter
    LDI r0, 0x240C
    LDI r2, 0
    LOAD r2, r0
    ADD r2, r9
    STORE r0, r2

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r10            ; r10 = key (0 if none)

    ; Q = quit
    LDI r2, 81
    CMP r10, r2
    JZ r7, do_quit

    ; W = increase tempo (decrease delay)
    LDI r2, 87
    CMP r10, r2
    JZ r7, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r2, 83
    CMP r10, r2
    JZ r7, tempo_down

    ; A = prev waveform
    LDI r2, 65
    CMP r10, r2
    JZ r7, wave_prev

    ; D = next waveform
    LDI r2, 68
    CMP r10, r2
    JZ r7, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r0, 0x2400
    LDI r2, 0
    LOAD r2, r0
    LDI r12, 5
    CMP r2, r12
    BLT r7, check_step  ; min tempo = 5
    LDI r12, 2
    SUB r2, r12
    STORE r0, r2
    JMP check_step

tempo_down:
    LDI r0, 0x2400
    LDI r2, 0
    LOAD r2, r0
    LDI r12, 60
    CMP r2, r12
    BGE r7, check_step  ; max tempo = 60
    LDI r12, 2
    ADD r2, r12
    STORE r0, r2
    JMP check_step

wave_prev:
    LDI r0, 0x2404
    LDI r2, 0
    LOAD r2, r0
    JZ r2, check_step  ; already at 0
    LDI r12, 1
    SUB r2, r12
    STORE r0, r2
    JMP check_step

wave_next:
    LDI r0, 0x2404
    LDI r2, 0
    LOAD r2, r0
    LDI r12, 3
    CMP r2, r12
    BGE r7, check_step ; max wave = 3 (sawtooth)
    LDI r12, 1
    ADD r2, r12
    STORE r0, r2
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r10, r5
    ; Read tempo
    LDI r0, 0x2400
    LDI r2, 0
    LOAD r2, r0
    ; ticks % tempo
    MOV r12, r10
    LDI r11, 0
    CMP r2, r11
    JZ r7, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r12 = ticks % tempo, check if 0
    JZ r12, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r0, 0x2408
    LDI r2, 0
    LOAD r2, r0         ; r2 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r2, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r2, 120
    LDI r12, 40
    BEEP r2, r12
    JMP toggle_phase

left_foot:
    LDI r2, 80
    LDI r12, 50
    BEEP r2, r12

toggle_phase:
    LDI r0, 0x2408
    LDI r2, 0
    LOAD r2, r0
    LDI r12, 1
    XOR r2, r12          ; toggle 0<->1
    STORE r0, r2

    ; Draw step indicator
    LDI r2, 0x2408
    LDI r11, 0
    LOAD r11, r2         ; r11 = phase
    LDI r2, 0xFF4444    ; red dot for left
    LDI r0, 0x44FF44    ; green dot for right
    JZ r11, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r10, r15       ; r10 = frame_counter
    LDI r2, 120
    CALL mod16          ; r12 = frame_counter % 120
    JZ r12, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r0, 0x2404
    LDI r2, 0
    LOAD r2, r0         ; r2 = waveform type

    LDI r12, 220         ; A3 = 220Hz
    LDI r11, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r2=wave, r12=freq, r11=dur already set
    NOTE r2, r12, r11

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r0, 0x2400
    LDI r2, 0
    LOAD r2, r0         ; r2 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r6, 20
    LDI r8, 100
    MOV r13, r2
    LDI r11, 3
    MUL r13, r11         ; r13 = tempo * 3 (bar width)
    LDI r14, 30         ; bar height
    LDI r3, 0x336699    ; steel blue
    RECTF r6, r8, r13, r14, r3

    ; Tempo label
    LDI r0, 0x2580
    LDI r2, 84
    STORE r0, r2
    ADD r0, r9
    LDI r2, 58
    STORE r0, r2
    ADD r0, r9
    LDI r2, 77
    STORE r0, r2
    ADD r0, r9
    LDI r2, 80
    STORE r0, r2
    ADD r0, r9
    LDI r2, 79
    STORE r0, r2
    ADD r0, r9
    LDI r2, 58
    STORE r0, r2
    ADD r0, r9
    LDI r2, 0
    STORE r0, r2
    LDI r6, 20
    LDI r8, 140
    LDI r0, 0x2580
    TEXT r6, r8, r0

    ; Waveform indicator
    LDI r0, 0x2404
    LDI r2, 0
    LOAD r2, r0         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r2, wave_sine
    LDI r12, 1
    CMP r2, r12
    JZ r7, wave_square
    LDI r12, 2
    CMP r2, r12
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

    ; ── Helper: mod16 (r12 = r10 % r2) ─────────────────────────
    ; r10 = dividend, r2 = divisor
    ; Returns r12 = remainder
    ; Clobbers r1, r4
mod16:
    PUSH r31
    PUSH r2
    PUSH r1
    PUSH r4
    MOV r12, r10
    MOV r1, r2          ; r1 = divisor
    LDI r4, 0           ; r4 = quotient
mod_loop:
    CMP r12, r1
    BLT r7, mod_done
    SUB r12, r1
    ADD r4, r9
    JMP mod_loop
mod_done:
    POP r4
    POP r1
    POP r2
    POP r31
    RET
