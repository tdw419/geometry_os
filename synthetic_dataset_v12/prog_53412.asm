; DESCRIPTION: Draws a black rectangle at (47, 17) with width 75 and height 75.
; PLAN: r0=47(x), r1=17(y), r2=75(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 17
LDI r2, 75
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
