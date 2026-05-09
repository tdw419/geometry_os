; DESCRIPTION: Draws a green rectangle at (61, 113) with width 37 and height 106.
; PLAN: r0=61(x), r1=113(y), r2=37(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 113
LDI r2, 37
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
