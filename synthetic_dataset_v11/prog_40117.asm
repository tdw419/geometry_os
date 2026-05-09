; DESCRIPTION: Draws a magenta rectangle at (100, 44) with width 51 and height 54.
; PLAN: r0=100(x), r1=44(y), r2=51(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 44
LDI r2, 51
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
