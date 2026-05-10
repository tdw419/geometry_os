; DESCRIPTION: Draws a blue rectangle at (55, 13) with width 15 and height 57.
; PLAN: r0=55(x), r1=13(y), r2=15(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 13
LDI r2, 15
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
