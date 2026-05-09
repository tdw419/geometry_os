; DESCRIPTION: Draws a blue rectangle at (72, 75) with width 115 and height 97.
; PLAN: r0=72(x), r1=75(y), r2=115(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 75
LDI r2, 115
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
