; DESCRIPTION: Draws a white rectangle at (132, 34) with width 65 and height 39.
; PLAN: r0=132(x), r1=34(y), r2=65(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 34
LDI r2, 65
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
