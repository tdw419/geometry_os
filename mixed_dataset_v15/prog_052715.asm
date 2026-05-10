; DESCRIPTION: Draws a green rectangle at (204, 3) with width 34 and height 116.
; PLAN: r0=204(x), r1=3(y), r2=34(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 3
LDI r2, 34
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
