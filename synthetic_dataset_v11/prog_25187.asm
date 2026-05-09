; DESCRIPTION: Draws a magenta rectangle at (87, 71) with width 100 and height 96.
; PLAN: r0=87(x), r1=71(y), r2=100(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 71
LDI r2, 100
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
