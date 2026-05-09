; DESCRIPTION: Draws a white rectangle at (157, 43) with width 62 and height 28.
; PLAN: r0=157(x), r1=43(y), r2=62(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 43
LDI r2, 62
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
