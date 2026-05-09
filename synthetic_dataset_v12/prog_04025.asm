; DESCRIPTION: Draws a blue rectangle at (9, 85) with width 105 and height 13.
; PLAN: r0=9(x), r1=85(y), r2=105(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 85
LDI r2, 105
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
