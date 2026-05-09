; DESCRIPTION: Draws a blue rectangle at (187, 75) with width 66 and height 83.
; PLAN: r0=187(x), r1=75(y), r2=66(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 75
LDI r2, 66
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
