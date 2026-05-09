; DESCRIPTION: Draws a magenta rectangle at (111, 81) with width 93 and height 20.
; PLAN: r0=111(x), r1=81(y), r2=93(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 81
LDI r2, 93
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
