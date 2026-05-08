; DESCRIPTION: Draws a colored square at the screen with fixed size.

; sfx_demo.asm -- Retro sound effects catalog
;
; Plays a sequence of notes in different waveforms, each with a
; visual bar on screen. Proves the NOTE opcode works for all
; 5 waveforms with varied frequencies and durations.
;
; Waveforms: 0=sine, 1=square, 2=triangle, 3=sawtooth, 4=noise
;
; Registers:
;   r15  = waveform type
;   r8  = frequency (Hz)
;   r5  = duration (ms)
;   r10 = current sfx index
;   r4 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r14, 0x000033
  FILL r14
  LDI r15, 0       ; sine
  LDI r8, 440     ; A4
  LDI r5, 300     ; 300ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r15, 1       ; square
  LDI r8, 880     ; A5
  LDI r5, 150     ; 150ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r15, 1       ; square
  LDI r8, 110     ; A2
  LDI r5, 400     ; 400ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r15, 2       ; triangle
  LDI r8, 660     ; E5
  LDI r5, 250     ; 250ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r15, 3       ; sawtooth
  LDI r8, 220     ; A3
  LDI r5, 350     ; 350ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r15, 4       ; noise
  LDI r8, 100
  LDI r5, 200     ; 200ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r15, 0       ; sine
  LDI r8, 1200    ; high freq
  LDI r5, 500     ; long
  NOTE r15, r8, r5
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r15, 4       ; noise
  LDI r8, 80
  LDI r5, 80      ; short
  NOTE r15, r8, r5
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r15, 1       ; square
  LDI r8, 2000    ; very high
  LDI r5, 100     ; 100ms
  NOTE r15, r8, r5
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r15, 2       ; triangle
  LDI r8, 55      ; A1
  LDI r5, 600     ; 600ms
  NOTE r15, r8, r5
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r14, 0
  FILL r14
  HALT
