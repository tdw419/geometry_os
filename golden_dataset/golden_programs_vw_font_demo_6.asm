; DESCRIPTION: Render a red object at the screen.

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
LDI r1, 8           ; x = 8
LDI r5, 5           ; y = 5
LDI r14, title       ; addr
LDI r8, 0x00FF00    ; fg = green
LDI r4, 0           ; bg = transparent
VWTXT r1, r5, r14, r8, r4

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r1, 8
LDI r5, 25
LDI r14, wide_text
LDI r8, 0xFF8800    ; fg = orange
LDI r4, 0x222244    ; bg = dark blue
VWTXT r1, r5, r14, r8, r4

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r1, 8
LDI r5, 40
LDI r14, narrow_text
LDI r8, 0x00CCFF    ; fg = cyan
LDI r4, 0x222244    ; bg = dark blue
VWTXT r1, r5, r14, r8, r4

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r7, 1
FONT_SELECT r7       ; switch to variable-width for TEXT

LDI r1, 8
LDI r5, 60
LDI r14, font_select_test
LDI r8, 0xFFFF00    ; fg = yellow
TEXT r1, r5, r14

; Reset to default
LDI r7, 0
FONT_SELECT r7

; === Section 4: Background fill demo ===
LDI r1, 8
LDI r5, 85
LDI r14, bg_demo
LDI r8, 0xFFFFFF    ; fg = white
LDI r4, 0x004400    ; bg = dark green
VWTXT r1, r5, r14, r8, r4

; === Section 5: Mixed content paragraph ===
LDI r1, 8
LDI r5, 110
LDI r14, paragraph
LDI r8, 0xCCCCCC    ; fg = light gray
LDI r4, 0
VWTXT r1, r5, r14, r8, r4

; === Section 6: Word wrap demonstration ===
LDI r1, 8
LDI r5, 150
LDI r14, wrap_text
LDI r8, 0xFF66FF    ; fg = magenta
LDI r4, 0
VWTXT r1, r5, r14, r8, r4

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
