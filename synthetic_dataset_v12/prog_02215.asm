; DESCRIPTION: Draws a blue rectangle at (256, 31) with width 75 and height 15.
; PLAN: r0=256(x), r1=31(y), r2=75(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 31
LDI r2, 75
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
