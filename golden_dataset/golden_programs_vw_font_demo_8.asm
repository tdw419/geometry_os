; DESCRIPTION: The GeOS assembly code demonstrates the use of variable-width font rendering with the VWTXT opcode and switches between different font modes using the FONT_SELECT opcode. It displays various text strings in different colors, backgrounds, and styles to showcase the capabilities of proportional fonts compared to fixed-width fonts.

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
LDI r15, 8           ; x = 8
LDI r13, 5           ; y = 5
LDI r10, title       ; addr
LDI r4, 0x00FF00    ; fg = green
LDI r1, 0           ; bg = transparent
VWTXT r15, r13, r10, r4, r1

; === Section 2: Compare fixed vs variable ===
; Render "MMMMMMMMMM" with VWTXT (proportional)
LDI r15, 8
LDI r13, 25
LDI r10, wide_text
LDI r4, 0xFF8800    ; fg = orange
LDI r1, 0x222244    ; bg = dark blue
VWTXT r15, r13, r10, r4, r1

; Render "iiiiiiiiii" with VWTXT (proportional, narrow)
LDI r15, 8
LDI r13, 40
LDI r10, narrow_text
LDI r4, 0x00CCFF    ; fg = cyan
LDI r1, 0x222244    ; bg = dark blue
VWTXT r15, r13, r10, r4, r1

; === Section 3: FONT_SELECT switches TEXT opcode ===
LDI r2, 1
FONT_SELECT r2       ; switch to variable-width for TEXT

LDI r15, 8
LDI r13, 60
LDI r10, font_select_test
LDI r4, 0xFFFF00    ; fg = yellow
TEXT r15, r13, r10

; Reset to default
LDI r2, 0
FONT_SELECT r2

; === Section 4: Background fill demo ===
LDI r15, 8
LDI r13, 85
LDI r10, bg_demo
LDI r4, 0xFFFFFF    ; fg = white
LDI r1, 0x004400    ; bg = dark green
VWTXT r15, r13, r10, r4, r1

; === Section 5: Mixed content paragraph ===
LDI r15, 8
LDI r13, 110
LDI r10, paragraph
LDI r4, 0xCCCCCC    ; fg = light gray
LDI r1, 0
VWTXT r15, r13, r10, r4, r1

; === Section 6: Word wrap demonstration ===
LDI r15, 8
LDI r13, 150
LDI r10, wrap_text
LDI r4, 0xFF66FF    ; fg = magenta
LDI r1, 0
VWTXT r15, r13, r10, r4, r1

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
