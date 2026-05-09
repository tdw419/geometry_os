; DESCRIPTION: Draws a black rectangle at (39, 75) with width 95 and height 97.
; PLAN: r0=39(x), r1=75(y), r2=95(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 75
LDI r2, 95
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
