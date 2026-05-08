; DESCRIPTION: Display a square using color colored at the screen.

; sfx_demo.asm -- Retro sound effects catalog
;
; Plays a sequence of notes in different waveforms, each with a
; visual bar on screen. Proves the NOTE opcode works for all
; 5 waveforms with varied frequencies and durations.
;
; Waveforms: 0=sine, 1=square, 2=triangle, 3=sawtooth, 4=noise
;
; Registers:
;   r13  = waveform type
;   r9  = frequency (Hz)
;   r15  = duration (ms)
;   r11 = current sfx index
;   r7 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r1, 0x000033
  FILL r1
  LDI r13, 0       ; sine
  LDI r9, 440     ; A4
  LDI r15, 300     ; 300ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r13, 1       ; square
  LDI r9, 880     ; A5
  LDI r15, 150     ; 150ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r13, 1       ; square
  LDI r9, 110     ; A2
  LDI r15, 400     ; 400ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r13, 2       ; triangle
  LDI r9, 660     ; E5
  LDI r15, 250     ; 250ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r13, 3       ; sawtooth
  LDI r9, 220     ; A3
  LDI r15, 350     ; 350ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r13, 4       ; noise
  LDI r9, 100
  LDI r15, 200     ; 200ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r13, 0       ; sine
  LDI r9, 1200    ; high freq
  LDI r15, 500     ; long
  NOTE r13, r9, r15
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r13, 4       ; noise
  LDI r9, 80
  LDI r15, 80      ; short
  NOTE r13, r9, r15
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r13, 1       ; square
  LDI r9, 2000    ; very high
  LDI r15, 100     ; 100ms
  NOTE r13, r9, r15
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r13, 2       ; triangle
  LDI r9, 55      ; A1
  LDI r15, 600     ; 600ms
  NOTE r13, r9, r15
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r1, 0
  FILL r1
  HALT
