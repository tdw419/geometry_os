; DESCRIPTION: Draws a white rectangle at (76, 232) with width 18 and height 18.
; PLAN: r0=76(x), r1=232(y), r2=18(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 232
LDI r2, 18
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
