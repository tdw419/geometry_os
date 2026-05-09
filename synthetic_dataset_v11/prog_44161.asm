; DESCRIPTION: Draws a magenta rectangle at (130, 27) with width 68 and height 26.
; PLAN: r0=130(x), r1=27(y), r2=68(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 27
LDI r2, 68
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
