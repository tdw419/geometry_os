; DESCRIPTION: A colored square centered at the screen with fixed size.

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
;   r1  = frequency (Hz)
;   r7  = duration (ms)
;   r2 = current sfx index
;   r5 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r3, 0x000033
  FILL r3
  LDI r4, 0       ; sine
  LDI r1, 440     ; A4
  LDI r7, 300     ; 300ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r4, 1       ; square
  LDI r1, 880     ; A5
  LDI r7, 150     ; 150ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r4, 1       ; square
  LDI r1, 110     ; A2
  LDI r7, 400     ; 400ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r4, 2       ; triangle
  LDI r1, 660     ; E5
  LDI r7, 250     ; 250ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r4, 3       ; sawtooth
  LDI r1, 220     ; A3
  LDI r7, 350     ; 350ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r4, 4       ; noise
  LDI r1, 100
  LDI r7, 200     ; 200ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r4, 0       ; sine
  LDI r1, 1200    ; high freq
  LDI r7, 500     ; long
  NOTE r4, r1, r7
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r4, 4       ; noise
  LDI r1, 80
  LDI r7, 80      ; short
  NOTE r4, r1, r7
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r4, 1       ; square
  LDI r1, 2000    ; very high
  LDI r7, 100     ; 100ms
  NOTE r4, r1, r7
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r4, 2       ; triangle
  LDI r1, 55      ; A1
  LDI r7, 600     ; 600ms
  NOTE r4, r1, r7
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r3, 0
  FILL r3
  HALT
