; DESCRIPTION: Draws a blue rectangle at (109, 37) with width 73 and height 13.
; PLAN: r0=109(x), r1=37(y), r2=73(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 37
LDI r2, 73
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
