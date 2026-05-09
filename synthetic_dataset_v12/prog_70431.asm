; DESCRIPTION: Draws a green rectangle at (361, 169) with width 17 and height 34.
; PLAN: r0=361(x), r1=169(y), r2=17(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 169
LDI r2, 17
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
