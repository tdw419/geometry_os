; DESCRIPTION: Draws a white rectangle at (19, 49) with width 116 and height 90.
; PLAN: r0=19(x), r1=49(y), r2=116(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 49
LDI r2, 116
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
