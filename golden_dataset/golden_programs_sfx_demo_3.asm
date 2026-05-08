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
;   r5  = waveform type
;   r14  = frequency (Hz)
;   r9  = duration (ms)
;   r10 = current sfx index
;   r15 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r13, 0x000033
  FILL r13
  LDI r5, 0       ; sine
  LDI r14, 440     ; A4
  LDI r9, 300     ; 300ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r5, 1       ; square
  LDI r14, 880     ; A5
  LDI r9, 150     ; 150ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r5, 1       ; square
  LDI r14, 110     ; A2
  LDI r9, 400     ; 400ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r5, 2       ; triangle
  LDI r14, 660     ; E5
  LDI r9, 250     ; 250ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r5, 3       ; sawtooth
  LDI r14, 220     ; A3
  LDI r9, 350     ; 350ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r5, 4       ; noise
  LDI r14, 100
  LDI r9, 200     ; 200ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r5, 0       ; sine
  LDI r14, 1200    ; high freq
  LDI r9, 500     ; long
  NOTE r5, r14, r9
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r5, 4       ; noise
  LDI r14, 80
  LDI r9, 80      ; short
  NOTE r5, r14, r9
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r5, 1       ; square
  LDI r14, 2000    ; very high
  LDI r9, 100     ; 100ms
  NOTE r5, r14, r9
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r5, 2       ; triangle
  LDI r14, 55      ; A1
  LDI r9, 600     ; 600ms
  NOTE r5, r14, r9
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r13, 0
  FILL r13
  HALT
