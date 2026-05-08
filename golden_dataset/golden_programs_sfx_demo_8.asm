; DESCRIPTION: Draw square: pos=the screen, color=colored, size=fixed size.

; sfx_demo.asm -- Retro sound effects catalog
;
; Plays a sequence of notes in different waveforms, each with a
; visual bar on screen. Proves the NOTE opcode works for all
; 5 waveforms with varied frequencies and durations.
;
; Waveforms: 0=sine, 1=square, 2=triangle, 3=sawtooth, 4=noise
;
; Registers:
;   r1  = waveform type
;   r12  = frequency (Hz)
;   r9  = duration (ms)
;   r2 = current sfx index
;   r6 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r10, 0x000033
  FILL r10
  LDI r1, 0       ; sine
  LDI r12, 440     ; A4
  LDI r9, 300     ; 300ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r1, 1       ; square
  LDI r12, 880     ; A5
  LDI r9, 150     ; 150ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r1, 1       ; square
  LDI r12, 110     ; A2
  LDI r9, 400     ; 400ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r1, 2       ; triangle
  LDI r12, 660     ; E5
  LDI r9, 250     ; 250ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r1, 3       ; sawtooth
  LDI r12, 220     ; A3
  LDI r9, 350     ; 350ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r1, 4       ; noise
  LDI r12, 100
  LDI r9, 200     ; 200ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r1, 0       ; sine
  LDI r12, 1200    ; high freq
  LDI r9, 500     ; long
  NOTE r1, r12, r9
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r1, 4       ; noise
  LDI r12, 80
  LDI r9, 80      ; short
  NOTE r1, r12, r9
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r1, 1       ; square
  LDI r12, 2000    ; very high
  LDI r9, 100     ; 100ms
  NOTE r1, r12, r9
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r1, 2       ; triangle
  LDI r12, 55      ; A1
  LDI r9, 600     ; 600ms
  NOTE r1, r12, r9
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r10, 0
  FILL r10
  HALT
