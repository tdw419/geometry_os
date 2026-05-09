; DESCRIPTION: Draws a red rectangle at (390, 63) with width 33 and height 98.
; PLAN: r0=390(x), r1=63(y), r2=33(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 63
LDI r2, 33
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
