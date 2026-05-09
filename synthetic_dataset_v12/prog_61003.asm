; DESCRIPTION: Draws a magenta rectangle at (416, 170) with width 27 and height 65.
; PLAN: r0=416(x), r1=170(y), r2=27(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 170
LDI r2, 27
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
