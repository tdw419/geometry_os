; DESCRIPTION: Draws a magenta rectangle at (44, 131) with width 51 and height 120.
; PLAN: r0=44(x), r1=131(y), r2=51(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 131
LDI r2, 51
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
