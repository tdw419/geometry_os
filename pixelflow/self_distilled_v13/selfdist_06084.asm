; DESCRIPTION: Draws a magenta rectangle at (91, 61) with width 89 and height 38.
; PLAN: r0=91(x), r1=61(y), r2=89(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 89
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
