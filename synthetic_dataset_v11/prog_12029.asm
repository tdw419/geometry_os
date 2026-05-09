; DESCRIPTION: Draws a white rectangle at (183, 184) with width 35 and height 68.
; PLAN: r0=183(x), r1=184(y), r2=35(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 184
LDI r2, 35
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
