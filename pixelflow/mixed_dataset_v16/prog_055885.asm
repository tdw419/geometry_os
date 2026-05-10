; DESCRIPTION: Draws a blue rectangle at (275, 89) with width 78 and height 20.
; PLAN: r0=275(x), r1=89(y), r2=78(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 89
LDI r2, 78
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
