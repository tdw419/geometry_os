; DESCRIPTION: Draws a magenta rectangle at (321, 119) with width 93 and height 100.
; PLAN: r0=321(x), r1=119(y), r2=93(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 119
LDI r2, 93
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
