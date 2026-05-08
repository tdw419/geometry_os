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
;   r9  = waveform type
;   r1  = frequency (Hz)
;   r5  = duration (ms)
;   r15 = current sfx index
;   r8 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r6, 0x000033
  FILL r6
  LDI r9, 0       ; sine
  LDI r1, 440     ; A4
  LDI r5, 300     ; 300ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r9, 1       ; square
  LDI r1, 880     ; A5
  LDI r5, 150     ; 150ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r9, 1       ; square
  LDI r1, 110     ; A2
  LDI r5, 400     ; 400ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r9, 2       ; triangle
  LDI r1, 660     ; E5
  LDI r5, 250     ; 250ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r9, 3       ; sawtooth
  LDI r1, 220     ; A3
  LDI r5, 350     ; 350ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r9, 4       ; noise
  LDI r1, 100
  LDI r5, 200     ; 200ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r9, 0       ; sine
  LDI r1, 1200    ; high freq
  LDI r5, 500     ; long
  NOTE r9, r1, r5
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r9, 4       ; noise
  LDI r1, 80
  LDI r5, 80      ; short
  NOTE r9, r1, r5
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r9, 1       ; square
  LDI r1, 2000    ; very high
  LDI r5, 100     ; 100ms
  NOTE r9, r1, r5
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r9, 2       ; triangle
  LDI r1, 55      ; A1
  LDI r5, 600     ; 600ms
  NOTE r9, r1, r5
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r6, 0
  FILL r6
  HALT
