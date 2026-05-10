; DESCRIPTION: Draws a white rectangle at (282, 62) with width 70 and height 66.
; PLAN: r0=282(x), r1=62(y), r2=70(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 62
LDI r2, 70
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
