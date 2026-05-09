; DESCRIPTION: Draws a white rectangle at (122, 43) with width 45 and height 97.
; PLAN: r0=122(x), r1=43(y), r2=45(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 43
LDI r2, 45
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
