; DESCRIPTION: Draws a blue rectangle at (66, 96) with width 75 and height 38.
; PLAN: r0=66(x), r1=96(y), r2=75(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 96
LDI r2, 75
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
