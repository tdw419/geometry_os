; DESCRIPTION: Draws a magenta rectangle at (106, 109) with width 93 and height 37.
; PLAN: r0=106(x), r1=109(y), r2=93(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 109
LDI r2, 93
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
