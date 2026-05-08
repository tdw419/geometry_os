; DESCRIPTION: Geometry OS program to draw a red object.

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
LDI r10, 8           ; x = 8
LDI r13, 5           ; y = 5
LDI r7, title       ; addr
LDI r11, 0x00FF00    ; fg = green
LDI r2, 0           ; bg = transparent
VWTXT r10, r13, r7, r11, r2

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r10, 8
LDI r13, 25
LDI r7, wide_text
LDI r11, 0xFF8800    ; fg = orange
LDI r2, 0x222244    ; bg = dark blue
VWTXT r10, r13, r7, r11, r2

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r10, 8
LDI r13, 40
LDI r7, narrow_text
LDI r11, 0x00CCFF    ; fg = cyan
LDI r2, 0x222244    ; bg = dark blue
VWTXT r10, r13, r7, r11, r2

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r9, 1
FONT_SELECT r9       ; switch to variable-width for TEXT

LDI r10, 8
LDI r13, 60
LDI r7, font_select_test
LDI r11, 0xFFFF00    ; fg = yellow
TEXT r10, r13, r7

; Reset to default
LDI r9, 0
FONT_SELECT r9

; === Section 4: Background fill demo ===
LDI r10, 8
LDI r13, 85
LDI r7, bg_demo
LDI r11, 0xFFFFFF    ; fg = white
LDI r2, 0x004400    ; bg = dark green
VWTXT r10, r13, r7, r11, r2

; === Section 5: Mixed content paragraph ===
LDI r10, 8
LDI r13, 110
LDI r7, paragraph
LDI r11, 0xCCCCCC    ; fg = light gray
LDI r2, 0
VWTXT r10, r13, r7, r11, r2

; === Section 6: Word wrap demonstration ===
LDI r10, 8
LDI r13, 150
LDI r7, wrap_text
LDI r11, 0xFF66FF    ; fg = magenta
LDI r2, 0
VWTXT r10, r13, r7, r11, r2

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
