; DESCRIPTION: Draws a green rectangle at (184, 177) with width 106 and height 54.
; PLAN: r0=184(x), r1=177(y), r2=106(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 177
LDI r2, 106
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
