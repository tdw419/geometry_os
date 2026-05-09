; DESCRIPTION: Draws a blue rectangle at (66, 7) with width 95 and height 25.
; PLAN: r0=66(x), r1=7(y), r2=95(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 7
LDI r2, 95
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
