; DESCRIPTION: Draws a white rectangle at (223, 216) with width 116 and height 11.
; PLAN: r0=223(x), r1=216(y), r2=116(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 216
LDI r2, 116
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
