; DESCRIPTION: Display a object using color red at the screen.

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
LDI r3, 8           ; x = 8
LDI r13, 5           ; y = 5
LDI r1, title       ; addr
LDI r8, 0x00FF00    ; fg = green
LDI r15, 0           ; bg = transparent
VWTXT r3, r13, r1, r8, r15

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r3, 8
LDI r13, 25
LDI r1, wide_text
LDI r8, 0xFF8800    ; fg = orange
LDI r15, 0x222244    ; bg = dark blue
VWTXT r3, r13, r1, r8, r15

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r3, 8
LDI r13, 40
LDI r1, narrow_text
LDI r8, 0x00CCFF    ; fg = cyan
LDI r15, 0x222244    ; bg = dark blue
VWTXT r3, r13, r1, r8, r15

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r4, 1
FONT_SELECT r4       ; switch to variable-width for TEXT

LDI r3, 8
LDI r13, 60
LDI r1, font_select_test
LDI r8, 0xFFFF00    ; fg = yellow
TEXT r3, r13, r1

; Reset to default
LDI r4, 0
FONT_SELECT r4

; === Section 4: Background fill demo ===
LDI r3, 8
LDI r13, 85
LDI r1, bg_demo
LDI r8, 0xFFFFFF    ; fg = white
LDI r15, 0x004400    ; bg = dark green
VWTXT r3, r13, r1, r8, r15

; === Section 5: Mixed content paragraph ===
LDI r3, 8
LDI r13, 110
LDI r1, paragraph
LDI r8, 0xCCCCCC    ; fg = light gray
LDI r15, 0
VWTXT r3, r13, r1, r8, r15

; === Section 6: Word wrap demonstration ===
LDI r3, 8
LDI r13, 150
LDI r1, wrap_text
LDI r8, 0xFF66FF    ; fg = magenta
LDI r15, 0
VWTXT r3, r13, r1, r8, r15

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
