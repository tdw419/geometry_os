; DESCRIPTION: Draws a green rectangle at (200, 19) with width 26 and height 19.
; PLAN: r0=200(x), r1=19(y), r2=26(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 19
LDI r2, 26
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
