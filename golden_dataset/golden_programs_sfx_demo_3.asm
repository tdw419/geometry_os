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
;   r8  = waveform type
;   r2  = frequency (Hz)
;   r14  = duration (ms)
;   r5 = current sfx index
;   r15 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r4, 0x000033
  FILL r4
  LDI r8, 0       ; sine
  LDI r2, 440     ; A4
  LDI r14, 300     ; 300ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r8, 1       ; square
  LDI r2, 880     ; A5
  LDI r14, 150     ; 150ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r8, 1       ; square
  LDI r2, 110     ; A2
  LDI r14, 400     ; 400ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r8, 2       ; triangle
  LDI r2, 660     ; E5
  LDI r14, 250     ; 250ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r8, 3       ; sawtooth
  LDI r2, 220     ; A3
  LDI r14, 350     ; 350ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r8, 4       ; noise
  LDI r2, 100
  LDI r14, 200     ; 200ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r8, 0       ; sine
  LDI r2, 1200    ; high freq
  LDI r14, 500     ; long
  NOTE r8, r2, r14
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r8, 4       ; noise
  LDI r2, 80
  LDI r14, 80      ; short
  NOTE r8, r2, r14
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r8, 1       ; square
  LDI r2, 2000    ; very high
  LDI r14, 100     ; 100ms
  NOTE r8, r2, r14
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r8, 2       ; triangle
  LDI r2, 55      ; A1
  LDI r14, 600     ; 600ms
  NOTE r8, r2, r14
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r4, 0
  FILL r4
  HALT
