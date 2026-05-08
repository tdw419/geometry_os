; DESCRIPTION: Render a colored square at the screen.

; sfx_demo.asm -- Retro sound effects catalog
;
; Plays a sequence of notes in different waveforms, each with a
; visual bar on screen. Proves the NOTE opcode works for all
; 5 waveforms with varied frequencies and durations.
;
; Waveforms: 0=sine, 1=square, 2=triangle, 3=sawtooth, 4=noise
;
; Registers:
;   r2  = waveform type
;   r1  = frequency (Hz)
;   r4  = duration (ms)
;   r15 = current sfx index
;   r8 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r10, 0x000033
  FILL r10
  LDI r2, 0       ; sine
  LDI r1, 440     ; A4
  LDI r4, 300     ; 300ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r2, 1       ; square
  LDI r1, 880     ; A5
  LDI r4, 150     ; 150ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r2, 1       ; square
  LDI r1, 110     ; A2
  LDI r4, 400     ; 400ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r2, 2       ; triangle
  LDI r1, 660     ; E5
  LDI r4, 250     ; 250ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r2, 3       ; sawtooth
  LDI r1, 220     ; A3
  LDI r4, 350     ; 350ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r2, 4       ; noise
  LDI r1, 100
  LDI r4, 200     ; 200ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r2, 0       ; sine
  LDI r1, 1200    ; high freq
  LDI r4, 500     ; long
  NOTE r2, r1, r4
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r2, 4       ; noise
  LDI r1, 80
  LDI r4, 80      ; short
  NOTE r2, r1, r4
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r2, 1       ; square
  LDI r1, 2000    ; very high
  LDI r4, 100     ; 100ms
  NOTE r2, r1, r4
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r2, 2       ; triangle
  LDI r1, 55      ; A1
  LDI r4, 600     ; 600ms
  NOTE r2, r1, r4
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r10, 0
  FILL r10
  HALT
