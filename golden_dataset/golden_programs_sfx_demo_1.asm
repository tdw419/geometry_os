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
;   r3  = waveform type
;   r15  = frequency (Hz)
;   r12  = duration (ms)
;   r10 = current sfx index
;   r13 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r5, 0x000033
  FILL r5
  LDI r3, 0       ; sine
  LDI r15, 440     ; A4
  LDI r12, 300     ; 300ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r3, 1       ; square
  LDI r15, 880     ; A5
  LDI r12, 150     ; 150ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r3, 1       ; square
  LDI r15, 110     ; A2
  LDI r12, 400     ; 400ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r3, 2       ; triangle
  LDI r15, 660     ; E5
  LDI r12, 250     ; 250ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r3, 3       ; sawtooth
  LDI r15, 220     ; A3
  LDI r12, 350     ; 350ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r3, 4       ; noise
  LDI r15, 100
  LDI r12, 200     ; 200ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r3, 0       ; sine
  LDI r15, 1200    ; high freq
  LDI r12, 500     ; long
  NOTE r3, r15, r12
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r3, 4       ; noise
  LDI r15, 80
  LDI r12, 80      ; short
  NOTE r3, r15, r12
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r3, 1       ; square
  LDI r15, 2000    ; very high
  LDI r12, 100     ; 100ms
  NOTE r3, r15, r12
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r3, 2       ; triangle
  LDI r15, 55      ; A1
  LDI r12, 600     ; 600ms
  NOTE r3, r15, r12
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r5, 0
  FILL r5
  HALT
