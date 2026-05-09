; DESCRIPTION: Draws a green rectangle at (74, 39) with width 119 and height 43.
; PLAN: r0=74(x), r1=39(y), r2=119(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 39
LDI r2, 119
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
