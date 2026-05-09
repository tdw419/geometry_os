; DESCRIPTION: Draws a green rectangle at (45, 136) with width 43 and height 39.
; PLAN: r0=45(x), r1=136(y), r2=43(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 136
LDI r2, 43
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
