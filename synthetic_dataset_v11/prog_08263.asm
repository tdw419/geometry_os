; DESCRIPTION: Draws a green rectangle at (13, 90) with width 20 and height 63.
; PLAN: r0=13(x), r1=90(y), r2=20(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 90
LDI r2, 20
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
