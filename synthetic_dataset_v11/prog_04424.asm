; DESCRIPTION: Draws a green rectangle at (34, 113) with width 52 and height 98.
; PLAN: r0=34(x), r1=113(y), r2=52(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 113
LDI r2, 52
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
