; DESCRIPTION: Draws a white rectangle at (219, 94) with width 115 and height 116.
; PLAN: r0=219(x), r1=94(y), r2=115(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 94
LDI r2, 115
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
