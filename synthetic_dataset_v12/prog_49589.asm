; DESCRIPTION: Draws a white rectangle at (122, 74) with width 78 and height 115.
; PLAN: r0=122(x), r1=74(y), r2=78(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 74
LDI r2, 78
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
