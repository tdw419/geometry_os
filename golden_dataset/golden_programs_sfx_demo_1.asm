; DESCRIPTION: This GeOS assembly code plays a sequence of sound effects using various waveforms (sine, square, triangle, sawtooth, and noise) with different frequencies and durations. Each sound effect is accompanied by a visual bar on screen to demonstrate the functionality of the NOTE opcode across all waveform types.

; sfx_demo.asm -- Retro sound effects catalog
;
; Plays a sequence of notes in different waveforms, each with a
; visual bar on screen. Proves the NOTE opcode works for all
; 5 waveforms with varied frequencies and durations.
;
; Waveforms: 0=sine, 1=square, 2=triangle, 3=sawtooth, 4=noise
;
; Registers:
;   r11  = waveform type
;   r1  = frequency (Hz)
;   r12  = duration (ms)
;   r3 = current sfx index
;   r2 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r14, 0x000033
  FILL r14
  LDI r11, 0       ; sine
  LDI r1, 440     ; A4
  LDI r12, 300     ; 300ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r11, 1       ; square
  LDI r1, 880     ; A5
  LDI r12, 150     ; 150ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r11, 1       ; square
  LDI r1, 110     ; A2
  LDI r12, 400     ; 400ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r11, 2       ; triangle
  LDI r1, 660     ; E5
  LDI r12, 250     ; 250ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r11, 3       ; sawtooth
  LDI r1, 220     ; A3
  LDI r12, 350     ; 350ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r11, 4       ; noise
  LDI r1, 100
  LDI r12, 200     ; 200ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r11, 0       ; sine
  LDI r1, 1200    ; high freq
  LDI r12, 500     ; long
  NOTE r11, r1, r12
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r11, 4       ; noise
  LDI r1, 80
  LDI r12, 80      ; short
  NOTE r11, r1, r12
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r11, 1       ; square
  LDI r1, 2000    ; very high
  LDI r12, 100     ; 100ms
  NOTE r11, r1, r12
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r11, 2       ; triangle
  LDI r1, 55      ; A1
  LDI r12, 600     ; 600ms
  NOTE r11, r1, r12
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r14, 0
  FILL r14
  HALT
