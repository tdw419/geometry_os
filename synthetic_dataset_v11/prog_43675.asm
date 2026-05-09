; DESCRIPTION: Draws a green rectangle at (63, 170) with width 77 and height 13.
; PLAN: r0=63(x), r1=170(y), r2=77(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 170
LDI r2, 77
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
