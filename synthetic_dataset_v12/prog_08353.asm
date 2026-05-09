; DESCRIPTION: Draws a green rectangle at (493, 63) with width 13 and height 110.
; PLAN: r0=493(x), r1=63(y), r2=13(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 63
LDI r2, 13
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
