; DESCRIPTION: Draws a white rectangle at (329, 118) with width 62 and height 34.
; PLAN: r0=329(x), r1=118(y), r2=62(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 118
LDI r2, 62
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
