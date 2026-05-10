; DESCRIPTION: Draws a magenta rectangle at (343, 93) with width 21 and height 54.
; PLAN: r0=343(x), r1=93(y), r2=21(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 93
LDI r2, 21
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
