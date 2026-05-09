; DESCRIPTION: Draws a green rectangle at (66, 90) with width 39 and height 105.
; PLAN: r0=66(x), r1=90(y), r2=39(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 90
LDI r2, 39
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
