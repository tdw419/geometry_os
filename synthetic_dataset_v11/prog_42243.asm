; DESCRIPTION: Draws a green rectangle at (111, 176) with width 88 and height 77.
; PLAN: r0=111(x), r1=176(y), r2=88(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 176
LDI r2, 88
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
