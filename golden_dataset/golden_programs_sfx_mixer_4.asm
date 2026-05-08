; DESCRIPTION: Display a object using color red at the screen.

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
LDI r0, 15
LDI r12, 0x2400
STORE r12, r0           ; tempo = 15 frames between steps

LDI r0, 0
LDI r12, 0x2404
STORE r12, r0           ; ambient_wave = 0 (sine)

LDI r0, 0
LDI r12, 0x2408
STORE r12, r0           ; step_phase = 0 (left foot)

LDI r0, 0
LDI r12, 0x240C
STORE r12, r0           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r0, 0x000000
FILL r0                ; clear screen black

LDI r0, 0x00FF00
LDI r15, 80
LDI r2, 20
LDI r12, 0x2500
LDI r0, 83             ; 'S'
STORE r12, r0
ADD r12, r14
LDI r0, 70             ; 'F'
STORE r12, r0
ADD r12, r14
LDI r0, 88             ; 'X'
STORE r12, r0
ADD r12, r14
LDI r0, 95             ; '_'
STORE r12, r0
ADD r12, r14
LDI r0, 77             ; 'M'
STORE r12, r0
ADD r12, r14
LDI r0, 73             ; 'I'
STORE r12, r0
ADD r12, r14
LDI r0, 88             ; 'X'
STORE r12, r0
ADD r12, r14
LDI r0, 69             ; 'E'
STORE r12, r0
ADD r12, r14
LDI r0, 82             ; 'R'
STORE r12, r0
ADD r12, r14
LDI r0, 0              ; null terminator
STORE r12, r0
LDI r12, 0x2500
TEXT r15, r2, r12

; Instructions
LDI r12, 0x2520
LDI r0, 87
STORE r12, r0
ADD r12, r14
LDI r0, 47
STORE r12, r0
ADD r12, r14
LDI r0, 83
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 61
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 84
STORE r12, r0
ADD r12, r14
LDI r0, 69
STORE r12, r0
ADD r12, r14
LDI r0, 77
STORE r12, r0
ADD r12, r14
LDI r0, 80
STORE r12, r0
ADD r12, r14
LDI r0, 79
STORE r12, r0
ADD r12, r14
LDI r0, 0
STORE r12, r0
LDI r15, 80
LDI r2, 40
LDI r12, 0x2520
TEXT r15, r2, r12

; A/D line
LDI r12, 0x2540
LDI r0, 65
STORE r12, r0
ADD r12, r14
LDI r0, 47
STORE r12, r0
ADD r12, r14
LDI r0, 68
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 61
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 87
STORE r12, r0
ADD r12, r14
LDI r0, 65
STORE r12, r0
ADD r12, r14
LDI r0, 86
STORE r12, r0
ADD r12, r14
LDI r0, 69
STORE r12, r0
ADD r12, r14
LDI r0, 0
STORE r12, r0
LDI r15, 80
LDI r2, 50
LDI r12, 0x2540
TEXT r15, r2, r12

; Q line
LDI r12, 0x2560
LDI r0, 81
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 61
STORE r12, r0
ADD r12, r14
LDI r0, 32
STORE r12, r0
ADD r12, r14
LDI r0, 81
STORE r12, r0
ADD r12, r14
LDI r0, 85
STORE r12, r0
ADD r12, r14
LDI r0, 73
STORE r12, r0
ADD r12, r14
LDI r0, 84
STORE r12, r0
ADD r12, r14
LDI r0, 0
STORE r12, r0
LDI r15, 80
LDI r2, 60
LDI r12, 0x2560
TEXT r15, r2, r12

; ── Main Loop ──────────────────────────────────────────────────
LDI r14, 1              ; constant 1
LDI r13, 0xFFE          ; TICKS port
LDI r6, 0x2400         ; tempo addr
LDI r7, 0x2404        ; ambient_wave addr
LDI r11, 0x2408        ; step_phase addr
LDI r4, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r0, 0x000000
    FILL r0            ; clear screen

    ; Increment frame counter
    LDI r12, 0x240C
    LDI r0, 0
    LOAD r0, r12
    ADD r0, r14
    STORE r12, r0

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r10            ; r10 = key (0 if none)

    ; Q = quit
    LDI r0, 81
    CMP r10, r0
    JZ r9, do_quit

    ; W = increase tempo (decrease delay)
    LDI r0, 87
    CMP r10, r0
    JZ r9, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r0, 83
    CMP r10, r0
    JZ r9, tempo_down

    ; A = prev waveform
    LDI r0, 65
    CMP r10, r0
    JZ r9, wave_prev

    ; D = next waveform
    LDI r0, 68
    CMP r10, r0
    JZ r9, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r12, 0x2400
    LDI r0, 0
    LOAD r0, r12
    LDI r1, 5
    CMP r0, r1
    BLT r9, check_step  ; min tempo = 5
    LDI r1, 2
    SUB r0, r1
    STORE r12, r0
    JMP check_step

tempo_down:
    LDI r12, 0x2400
    LDI r0, 0
    LOAD r0, r12
    LDI r1, 60
    CMP r0, r1
    BGE r9, check_step  ; max tempo = 60
    LDI r1, 2
    ADD r0, r1
    STORE r12, r0
    JMP check_step

wave_prev:
    LDI r12, 0x2404
    LDI r0, 0
    LOAD r0, r12
    JZ r0, check_step  ; already at 0
    LDI r1, 1
    SUB r0, r1
    STORE r12, r0
    JMP check_step

wave_next:
    LDI r12, 0x2404
    LDI r0, 0
    LOAD r0, r12
    LDI r1, 3
    CMP r0, r1
    BGE r9, check_step ; max wave = 3 (sawtooth)
    LDI r1, 1
    ADD r0, r1
    STORE r12, r0
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r10, r13
    ; Read tempo
    LDI r12, 0x2400
    LDI r0, 0
    LOAD r0, r12
    ; ticks % tempo
    MOV r1, r10
    LDI r5, 0
    CMP r0, r5
    JZ r9, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r1 = ticks % tempo, check if 0
    JZ r1, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r12, 0x2408
    LDI r0, 0
    LOAD r0, r12         ; r0 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r0, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r0, 120
    LDI r1, 40
    BEEP r0, r1
    JMP toggle_phase

left_foot:
    LDI r0, 80
    LDI r1, 50
    BEEP r0, r1

toggle_phase:
    LDI r12, 0x2408
    LDI r0, 0
    LOAD r0, r12
    LDI r1, 1
    XOR r0, r1          ; toggle 0<->1
    STORE r12, r0

    ; Draw step indicator
    LDI r0, 0x2408
    LDI r5, 0
    LOAD r5, r0         ; r5 = phase
    LDI r0, 0xFF4444    ; red dot for left
    LDI r12, 0x44FF44    ; green dot for right
    JZ r5, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r10, r4       ; r10 = frame_counter
    LDI r0, 120
    CALL mod16          ; r1 = frame_counter % 120
    JZ r1, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r12, 0x2404
    LDI r0, 0
    LOAD r0, r12         ; r0 = waveform type

    LDI r1, 220         ; A3 = 220Hz
    LDI r5, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r0=wave, r1=freq, r5=dur already set
    NOTE r0, r1, r5

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r12, 0x2400
    LDI r0, 0
    LOAD r0, r12         ; r0 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r15, 20
    LDI r2, 100
    MOV r7, r0
    LDI r5, 3
    MUL r7, r5         ; r7 = tempo * 3 (bar width)
    LDI r11, 30         ; bar height
    LDI r6, 0x336699    ; steel blue
    RECTF r15, r2, r7, r11, r6

    ; Tempo label
    LDI r12, 0x2580
    LDI r0, 84
    STORE r12, r0
    ADD r12, r14
    LDI r0, 58
    STORE r12, r0
    ADD r12, r14
    LDI r0, 77
    STORE r12, r0
    ADD r12, r14
    LDI r0, 80
    STORE r12, r0
    ADD r12, r14
    LDI r0, 79
    STORE r12, r0
    ADD r12, r14
    LDI r0, 58
    STORE r12, r0
    ADD r12, r14
    LDI r0, 0
    STORE r12, r0
    LDI r15, 20
    LDI r2, 140
    LDI r12, 0x2580
    TEXT r15, r2, r12

    ; Waveform indicator
    LDI r12, 0x2404
    LDI r0, 0
    LOAD r0, r12         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r0, wave_sine
    LDI r1, 1
    CMP r0, r1
    JZ r9, wave_square
    LDI r1, 2
    CMP r0, r1
    JZ r9, wave_triangle
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

    ; ── Helper: mod16 (r1 = r10 % r0) ─────────────────────────
    ; r10 = dividend, r0 = divisor
    ; Returns r1 = remainder
    ; Clobbers r8, r3
mod16:
    PUSH r31
    PUSH r0
    PUSH r8
    PUSH r3
    MOV r1, r10
    MOV r8, r0          ; r8 = divisor
    LDI r3, 0           ; r3 = quotient
mod_loop:
    CMP r1, r8
    BLT r9, mod_done
    SUB r1, r8
    ADD r3, r14
    JMP mod_loop
mod_done:
    POP r3
    POP r8
    POP r0
    POP r31
    RET
