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
LDI r14, 8           ; x = 8
LDI r0, 5           ; y = 5
LDI r9, title       ; addr
LDI r2, 0x00FF00    ; fg = green
LDI r13, 0           ; bg = transparent
VWTXT r14, r0, r9, r2, r13

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r14, 8
LDI r0, 25
LDI r9, wide_text
LDI r2, 0xFF8800    ; fg = orange
LDI r13, 0x222244    ; bg = dark blue
VWTXT r14, r0, r9, r2, r13

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r14, 8
LDI r0, 40
LDI r9, narrow_text
LDI r2, 0x00CCFF    ; fg = cyan
LDI r13, 0x222244    ; bg = dark blue
VWTXT r14, r0, r9, r2, r13

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r12, 1
FONT_SELECT r12       ; switch to variable-width for TEXT

LDI r14, 8
LDI r0, 60
LDI r9, font_select_test
LDI r2, 0xFFFF00    ; fg = yellow
TEXT r14, r0, r9

; Reset to default
LDI r12, 0
FONT_SELECT r12

; === Section 4: Background fill demo ===
LDI r14, 8
LDI r0, 85
LDI r9, bg_demo
LDI r2, 0xFFFFFF    ; fg = white
LDI r13, 0x004400    ; bg = dark green
VWTXT r14, r0, r9, r2, r13

; === Section 5: Mixed content paragraph ===
LDI r14, 8
LDI r0, 110
LDI r9, paragraph
LDI r2, 0xCCCCCC    ; fg = light gray
LDI r13, 0
VWTXT r14, r0, r9, r2, r13

; === Section 6: Word wrap demonstration ===
LDI r14, 8
LDI r0, 150
LDI r9, wrap_text
LDI r2, 0xFF66FF    ; fg = magenta
LDI r13, 0
VWTXT r14, r0, r9, r2, r13

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
