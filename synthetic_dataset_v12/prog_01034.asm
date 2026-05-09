; DESCRIPTION: Draws a magenta rectangle at (85, 131) with width 115 and height 78.
; PLAN: r0=85(x), r1=131(y), r2=115(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
