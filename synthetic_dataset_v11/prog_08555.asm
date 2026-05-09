; DESCRIPTION: Draws a magenta rectangle at (112, 23) with width 30 and height 19.
; PLAN: r0=112(x), r1=23(y), r2=30(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 23
LDI r2, 30
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
