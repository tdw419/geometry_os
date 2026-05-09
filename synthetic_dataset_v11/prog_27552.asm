; DESCRIPTION: Draws a magenta rectangle at (184, 8) with width 52 and height 89.
; PLAN: r0=184(x), r1=8(y), r2=52(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 52
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
