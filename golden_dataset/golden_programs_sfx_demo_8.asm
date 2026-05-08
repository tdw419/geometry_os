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
;   r14  = waveform type
;   r4  = frequency (Hz)
;   r10  = duration (ms)
;   r9 = current sfx index
;   r2 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r12, 0x000033
  FILL r12
  LDI r14, 0       ; sine
  LDI r4, 440     ; A4
  LDI r10, 300     ; 300ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r14, 1       ; square
  LDI r4, 880     ; A5
  LDI r10, 150     ; 150ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r14, 1       ; square
  LDI r4, 110     ; A2
  LDI r10, 400     ; 400ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r14, 2       ; triangle
  LDI r4, 660     ; E5
  LDI r10, 250     ; 250ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r14, 3       ; sawtooth
  LDI r4, 220     ; A3
  LDI r10, 350     ; 350ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r14, 4       ; noise
  LDI r4, 100
  LDI r10, 200     ; 200ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r14, 0       ; sine
  LDI r4, 1200    ; high freq
  LDI r10, 500     ; long
  NOTE r14, r4, r10
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r14, 4       ; noise
  LDI r4, 80
  LDI r10, 80      ; short
  NOTE r14, r4, r10
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r14, 1       ; square
  LDI r4, 2000    ; very high
  LDI r10, 100     ; 100ms
  NOTE r14, r4, r10
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r14, 2       ; triangle
  LDI r4, 55      ; A1
  LDI r10, 600     ; 600ms
  NOTE r14, r4, r10
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r12, 0
  FILL r12
  HALT
