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
LDI r6, 15
LDI r15, 0x2400
STORE r15, r6           ; tempo = 15 frames between steps

LDI r6, 0
LDI r15, 0x2404
STORE r15, r6           ; ambient_wave = 0 (sine)

LDI r6, 0
LDI r15, 0x2408
STORE r15, r6           ; step_phase = 0 (left foot)

LDI r6, 0
LDI r15, 0x240C
STORE r15, r6           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r6, 0x000000
FILL r6                ; clear screen black

LDI r6, 0x00FF00
LDI r5, 80
LDI r2, 20
LDI r15, 0x2500
LDI r6, 83             ; 'S'
STORE r15, r6
ADD r15, r14
LDI r6, 70             ; 'F'
STORE r15, r6
ADD r15, r14
LDI r6, 88             ; 'X'
STORE r15, r6
ADD r15, r14
LDI r6, 95             ; '_'
STORE r15, r6
ADD r15, r14
LDI r6, 77             ; 'M'
STORE r15, r6
ADD r15, r14
LDI r6, 73             ; 'I'
STORE r15, r6
ADD r15, r14
LDI r6, 88             ; 'X'
STORE r15, r6
ADD r15, r14
LDI r6, 69             ; 'E'
STORE r15, r6
ADD r15, r14
LDI r6, 82             ; 'R'
STORE r15, r6
ADD r15, r14
LDI r6, 0              ; null terminator
STORE r15, r6
LDI r15, 0x2500
TEXT r5, r2, r15

; Instructions
LDI r15, 0x2520
LDI r6, 87
STORE r15, r6
ADD r15, r14
LDI r6, 47
STORE r15, r6
ADD r15, r14
LDI r6, 83
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 61
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 84
STORE r15, r6
ADD r15, r14
LDI r6, 69
STORE r15, r6
ADD r15, r14
LDI r6, 77
STORE r15, r6
ADD r15, r14
LDI r6, 80
STORE r15, r6
ADD r15, r14
LDI r6, 79
STORE r15, r6
ADD r15, r14
LDI r6, 0
STORE r15, r6
LDI r5, 80
LDI r2, 40
LDI r15, 0x2520
TEXT r5, r2, r15

; A/D line
LDI r15, 0x2540
LDI r6, 65
STORE r15, r6
ADD r15, r14
LDI r6, 47
STORE r15, r6
ADD r15, r14
LDI r6, 68
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 61
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 87
STORE r15, r6
ADD r15, r14
LDI r6, 65
STORE r15, r6
ADD r15, r14
LDI r6, 86
STORE r15, r6
ADD r15, r14
LDI r6, 69
STORE r15, r6
ADD r15, r14
LDI r6, 0
STORE r15, r6
LDI r5, 80
LDI r2, 50
LDI r15, 0x2540
TEXT r5, r2, r15

; Q line
LDI r15, 0x2560
LDI r6, 81
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 61
STORE r15, r6
ADD r15, r14
LDI r6, 32
STORE r15, r6
ADD r15, r14
LDI r6, 81
STORE r15, r6
ADD r15, r14
LDI r6, 85
STORE r15, r6
ADD r15, r14
LDI r6, 73
STORE r15, r6
ADD r15, r14
LDI r6, 84
STORE r15, r6
ADD r15, r14
LDI r6, 0
STORE r15, r6
LDI r5, 80
LDI r2, 60
LDI r15, 0x2560
TEXT r5, r2, r15

; ── Main Loop ──────────────────────────────────────────────────
LDI r14, 1              ; constant 1
LDI r11, 0xFFE          ; TICKS port
LDI r13, 0x2400         ; tempo addr
LDI r1, 0x2404        ; ambient_wave addr
LDI r10, 0x2408        ; step_phase addr
LDI r8, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r6, 0x000000
    FILL r6            ; clear screen

    ; Increment frame counter
    LDI r15, 0x240C
    LDI r6, 0
    LOAD r6, r15
    ADD r6, r14
    STORE r15, r6

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r0            ; r0 = key (0 if none)

    ; Q = quit
    LDI r6, 81
    CMP r0, r6
    JZ r3, do_quit

    ; W = increase tempo (decrease delay)
    LDI r6, 87
    CMP r0, r6
    JZ r3, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r6, 83
    CMP r0, r6
    JZ r3, tempo_down

    ; A = prev waveform
    LDI r6, 65
    CMP r0, r6
    JZ r3, wave_prev

    ; D = next waveform
    LDI r6, 68
    CMP r0, r6
    JZ r3, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r15, 0x2400
    LDI r6, 0
    LOAD r6, r15
    LDI r12, 5
    CMP r6, r12
    BLT r3, check_step  ; min tempo = 5
    LDI r12, 2
    SUB r6, r12
    STORE r15, r6
    JMP check_step

tempo_down:
    LDI r15, 0x2400
    LDI r6, 0
    LOAD r6, r15
    LDI r12, 60
    CMP r6, r12
    BGE r3, check_step  ; max tempo = 60
    LDI r12, 2
    ADD r6, r12
    STORE r15, r6
    JMP check_step

wave_prev:
    LDI r15, 0x2404
    LDI r6, 0
    LOAD r6, r15
    JZ r6, check_step  ; already at 0
    LDI r12, 1
    SUB r6, r12
    STORE r15, r6
    JMP check_step

wave_next:
    LDI r15, 0x2404
    LDI r6, 0
    LOAD r6, r15
    LDI r12, 3
    CMP r6, r12
    BGE r3, check_step ; max wave = 3 (sawtooth)
    LDI r12, 1
    ADD r6, r12
    STORE r15, r6
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r0, r11
    ; Read tempo
    LDI r15, 0x2400
    LDI r6, 0
    LOAD r6, r15
    ; ticks % tempo
    MOV r12, r0
    LDI r7, 0
    CMP r6, r7
    JZ r3, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r12 = ticks % tempo, check if 0
    JZ r12, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r15, 0x2408
    LDI r6, 0
    LOAD r6, r15         ; r6 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r6, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r6, 120
    LDI r12, 40
    BEEP r6, r12
    JMP toggle_phase

left_foot:
    LDI r6, 80
    LDI r12, 50
    BEEP r6, r12

toggle_phase:
    LDI r15, 0x2408
    LDI r6, 0
    LOAD r6, r15
    LDI r12, 1
    XOR r6, r12          ; toggle 0<->1
    STORE r15, r6

    ; Draw step indicator
    LDI r6, 0x2408
    LDI r7, 0
    LOAD r7, r6         ; r7 = phase
    LDI r6, 0xFF4444    ; red dot for left
    LDI r15, 0x44FF44    ; green dot for right
    JZ r7, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r0, r8       ; r0 = frame_counter
    LDI r6, 120
    CALL mod16          ; r12 = frame_counter % 120
    JZ r12, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r15, 0x2404
    LDI r6, 0
    LOAD r6, r15         ; r6 = waveform type

    LDI r12, 220         ; A3 = 220Hz
    LDI r7, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r6=wave, r12=freq, r7=dur already set
    NOTE r6, r12, r7

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r15, 0x2400
    LDI r6, 0
    LOAD r6, r15         ; r6 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r5, 20
    LDI r2, 100
    MOV r1, r6
    LDI r7, 3
    MUL r1, r7         ; r1 = tempo * 3 (bar width)
    LDI r10, 30         ; bar height
    LDI r13, 0x336699    ; steel blue
    RECTF r5, r2, r1, r10, r13

    ; Tempo label
    LDI r15, 0x2580
    LDI r6, 84
    STORE r15, r6
    ADD r15, r14
    LDI r6, 58
    STORE r15, r6
    ADD r15, r14
    LDI r6, 77
    STORE r15, r6
    ADD r15, r14
    LDI r6, 80
    STORE r15, r6
    ADD r15, r14
    LDI r6, 79
    STORE r15, r6
    ADD r15, r14
    LDI r6, 58
    STORE r15, r6
    ADD r15, r14
    LDI r6, 0
    STORE r15, r6
    LDI r5, 20
    LDI r2, 140
    LDI r15, 0x2580
    TEXT r5, r2, r15

    ; Waveform indicator
    LDI r15, 0x2404
    LDI r6, 0
    LOAD r6, r15         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r6, wave_sine
    LDI r12, 1
    CMP r6, r12
    JZ r3, wave_square
    LDI r12, 2
    CMP r6, r12
    JZ r3, wave_triangle
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

    ; ── Helper: mod16 (r12 = r0 % r6) ─────────────────────────
    ; r0 = dividend, r6 = divisor
    ; Returns r12 = remainder
    ; Clobbers r4, r9
mod16:
    PUSH r31
    PUSH r6
    PUSH r4
    PUSH r9
    MOV r12, r0
    MOV r4, r6          ; r4 = divisor
    LDI r9, 0           ; r9 = quotient
mod_loop:
    CMP r12, r4
    BLT r3, mod_done
    SUB r12, r4
    ADD r9, r14
    JMP mod_loop
mod_done:
    POP r9
    POP r4
    POP r6
    POP r31
    RET
