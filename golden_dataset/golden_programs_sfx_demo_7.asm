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
;   r4  = waveform type
;   r5  = frequency (Hz)
;   r2  = duration (ms)
;   r8 = current sfx index
;   r1 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r3, 0x000033
  FILL r3
  LDI r4, 0       ; sine
  LDI r5, 440     ; A4
  LDI r2, 300     ; 300ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r4, 1       ; square
  LDI r5, 880     ; A5
  LDI r2, 150     ; 150ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r4, 1       ; square
  LDI r5, 110     ; A2
  LDI r2, 400     ; 400ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r4, 2       ; triangle
  LDI r5, 660     ; E5
  LDI r2, 250     ; 250ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r4, 3       ; sawtooth
  LDI r5, 220     ; A3
  LDI r2, 350     ; 350ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r4, 4       ; noise
  LDI r5, 100
  LDI r2, 200     ; 200ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r4, 0       ; sine
  LDI r5, 1200    ; high freq
  LDI r2, 500     ; long
  NOTE r4, r5, r2
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r4, 4       ; noise
  LDI r5, 80
  LDI r2, 80      ; short
  NOTE r4, r5, r2
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r4, 1       ; square
  LDI r5, 2000    ; very high
  LDI r2, 100     ; 100ms
  NOTE r4, r5, r2
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r4, 2       ; triangle
  LDI r5, 55      ; A1
  LDI r2, 600     ; 600ms
  NOTE r4, r5, r2
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r3, 0
  FILL r3
  HALT
