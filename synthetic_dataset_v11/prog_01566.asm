; DESCRIPTION: Draws a magenta rectangle at (100, 52) with width 82 and height 115.
; PLAN: r0=100(x), r1=52(y), r2=82(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 52
LDI r2, 82
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
