; DESCRIPTION: Draws a green rectangle at (472, 52) with width 24 and height 27.
; PLAN: r0=472(x), r1=52(y), r2=24(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 52
LDI r2, 24
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
