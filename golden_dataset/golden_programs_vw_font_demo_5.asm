; DESCRIPTION: Draws a red object at the screen with fixed size.

; vw_font_demo.asm -- Phase 210: Variable-width font demo
; Demonstrates VWTXT (0xDB) and FONT_SELECT (0xDC) opcodes
;
; VWTXT renders proportional text: narrow chars like 'i' take 3px,
; wide chars like 'M' take 8px. This produces much more readable
; text compared to fixed-width fonts.
;
; FONT_SELECT switches the TEXT opcode between font modes:
;   0 = fixed 5x7 (default)
;   1 = variable-width 8x8
;   2 = tiny 3x5
;   3 = medium 5x7

; === Section 1: VWTXT title ===
LDI r4, 8           ; x = 8
LDI r2, 5           ; y = 5
LDI r7, title       ; addr
LDI r15, 0x00FF00    ; fg = green
LDI r3, 0           ; bg = transparent
VWTXT r4, r2, r7, r15, r3

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r4, 8
LDI r2, 25
LDI r7, wide_text
LDI r15, 0xFF8800    ; fg = orange
LDI r3, 0x222244    ; bg = dark blue
VWTXT r4, r2, r7, r15, r3

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r4, 8
LDI r2, 40
LDI r7, narrow_text
LDI r15, 0x00CCFF    ; fg = cyan
LDI r3, 0x222244    ; bg = dark blue
VWTXT r4, r2, r7, r15, r3

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r8, 1
FONT_SELECT r8       ; switch to variable-width for TEXT

LDI r4, 8
LDI r2, 60
LDI r7, font_select_test
LDI r15, 0xFFFF00    ; fg = yellow
TEXT r4, r2, r7

; Reset to default
LDI r8, 0
FONT_SELECT r8

; === Section 4: Background fill demo ===
LDI r4, 8
LDI r2, 85
LDI r7, bg_demo
LDI r15, 0xFFFFFF    ; fg = white
LDI r3, 0x004400    ; bg = dark green
VWTXT r4, r2, r7, r15, r3

; === Section 5: Mixed content paragraph ===
LDI r4, 8
LDI r2, 110
LDI r7, paragraph
LDI r15, 0xCCCCCC    ; fg = light gray
LDI r3, 0
VWTXT r4, r2, r7, r15, r3

; === Section 6: Word wrap demonstration ===
LDI r4, 8
LDI r2, 150
LDI r7, wrap_text
LDI r15, 0xFF66FF    ; fg = magenta
LDI r3, 0
VWTXT r4, r2, r7, r15, r3

HALT

; === String data ===
title:
  .ascii "VWTXT Variable-Width Font Demo"
  .byte 0

wide_text:
  .ascii "MMMMMMMMMM"
  .byte 0

narrow_text:
  .ascii "iiiiiiiiii"
  .byte 0

font_select_test:
  .ascii "TEXT opcode with FONT_SELECT mode 1"
  .byte 0

bg_demo:
  .ascii "Green background fill"
  .byte 0

paragraph:
  .ascii "Proportional fonts look better for reading."
  .byte 0

wrap_text:
  .ascii "This long line should automatically wrap when it reaches the right edge of the 256-pixel screen buffer"
  .byte 0
