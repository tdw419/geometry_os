; DESCRIPTION: Draws a magenta rectangle at (324, 2) with width 36 and height 100.
; PLAN: r0=324(x), r1=2(y), r2=36(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 2
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
