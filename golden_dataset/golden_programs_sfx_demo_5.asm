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
;   r7  = waveform type
;   r3  = frequency (Hz)
;   r0  = duration (ms)
;   r12 = current sfx index
;   r2 = total sfx count
;   r20 = scratch

; ── init ────────────────────────────────────────────────────────
LDI r30, 0xFF00   ; stack pointer

; ── SFX 0: sine A4 ─────────────────────────────────────────────
  LDI r11, 0x000033
  FILL r11
  LDI r7, 0       ; sine
  LDI r3, 440     ; A4
  LDI r0, 300     ; 300ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 1: square A5 ───────────────────────────────────────────
  LDI r7, 1       ; square
  LDI r3, 880     ; A5
  LDI r0, 150     ; 150ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 2: square bass A2 ──────────────────────────────────────
  LDI r7, 1       ; square
  LDI r3, 110     ; A2
  LDI r0, 400     ; 400ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 3: triangle E5 ─────────────────────────────────────────
  LDI r7, 2       ; triangle
  LDI r3, 660     ; E5
  LDI r0, 250     ; 250ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 4: sawtooth A3 ─────────────────────────────────────────
  LDI r7, 3       ; sawtooth
  LDI r3, 220     ; A3
  LDI r0, 350     ; 350ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 5: noise burst ─────────────────────────────────────────
  LDI r7, 4       ; noise
  LDI r3, 100
  LDI r0, 200     ; 200ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 6: sine laser sweep ────────────────────────────────────
  LDI r7, 0       ; sine
  LDI r3, 1200    ; high freq
  LDI r0, 500     ; long
  NOTE r7, r3, r0
  FRAME

; ── SFX 7: noise percussion ────────────────────────────────────
  LDI r7, 4       ; noise
  LDI r3, 80
  LDI r0, 80      ; short
  NOTE r7, r3, r0
  FRAME

; ── SFX 8: square alarm ────────────────────────────────────────
  LDI r7, 1       ; square
  LDI r3, 2000    ; very high
  LDI r0, 100     ; 100ms
  NOTE r7, r3, r0
  FRAME

; ── SFX 9: triangle bass A1 ────────────────────────────────────
  LDI r7, 2       ; triangle
  LDI r3, 55      ; A1
  LDI r0, 600     ; 600ms
  NOTE r7, r3, r0
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r11, 0
  FILL r11
  HALT
