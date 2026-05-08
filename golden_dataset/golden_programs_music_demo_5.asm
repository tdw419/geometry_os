; DESCRIPTION: A colored square centered at the screen with fixed size.

; music_demo.asm -- Simple melody with visual accompany
;
; Plays "Mary Had a Little Lamb" using square wave, with FRAME
; sync for visual bars showing each note's frequency.
;
; Melody: E4 D4 C4 D4 E4 E4 E4  D4 D4 D4  E4 G4 G4
;         E4 D4 C4 D4 E4 E4 E4 E4  D4 D4 E4 D4 C4
;
; Registers:
;   r11  = waveform (1 = square)
;   r14  = frequency (Hz)
;   r2  = duration (ms)
;   r9 = bar color
;   r20 = scratch

; ── constants ─────────────────────────────────────────────────────
#define WF_SQUARE 1
#define FREQ_C4 262
#define FREQ_D4 294
#define FREQ_E4 330
#define FREQ_G4 392
#define DUR_Q 400
#define DUR_H 800

; ── init ──────────────────────────────────────────────────────────
LDI r30, 0xFF00    ; stack pointer

; ── Melody: E D C D | E E E(h) | D D D(h) | E G G(h) ────────────

; Bar 1: E4 D4 C4 D4
  LDI r11, WF_SQUARE
  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_C4
  LDI r2, DUR_Q
  LDI r9, 0x009999
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

; Bar 2: E4 E4 E4(half)
  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_H
  NOTE r11, r14, r2
  FRAME

; Bar 3: D4 D4 D4(half)
  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_Q
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_H
  NOTE r11, r14, r2
  FRAME

; Bar 4: E4 G4 G4(half)
  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_G4
  LDI r2, DUR_Q
  LDI r9, 0x00FF99
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_H
  NOTE r11, r14, r2
  FRAME

; ── Melody part 2: E D C D | E E E E(h) | D D E D | C(h) ───────

; Bar 5: E4 D4 C4 D4
  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_C4
  LDI r2, DUR_Q
  LDI r9, 0x009999
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

; Bar 6: E4 E4 E4 E4(half)
  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_Q
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_Q
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_H
  NOTE r11, r14, r2
  FRAME

; Bar 7: D4 D4 E4 D4
  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r2, DUR_Q
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_E4
  LDI r2, DUR_Q
  LDI r9, 0x00FFFF
  FILL r9
  NOTE r11, r14, r2
  FRAME

  LDI r14, FREQ_D4
  LDI r2, DUR_Q
  LDI r9, 0x00CCCC
  FILL r9
  NOTE r11, r14, r2
  FRAME

; Bar 8: C4(half) -- final note
  LDI r14, FREQ_C4
  LDI r2, DUR_H
  LDI r9, 0x009999
  FILL r9
  NOTE r11, r14, r2
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r9, 0
  FILL r9
  HALT
