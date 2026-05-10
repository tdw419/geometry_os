; DESCRIPTION: Draws a magenta rectangle at (399, 37) with width 53 and height 89.
; PLAN: r0=399(x), r1=37(y), r2=53(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 37
LDI r2, 53
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
