; DESCRIPTION: Draws a white rectangle at (53, 184) with width 78 and height 15.
; PLAN: r0=53(x), r1=184(y), r2=78(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 184
LDI r2, 78
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
