; DESCRIPTION: Draws a green rectangle at (176, 184) with width 100 and height 20.
; PLAN: r0=176(x), r1=184(y), r2=100(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 184
LDI r2, 100
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
