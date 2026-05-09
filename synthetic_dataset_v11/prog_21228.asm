; DESCRIPTION: Draws a magenta rectangle at (194, 71) with width 30 and height 19.
; PLAN: r0=194(x), r1=71(y), r2=30(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 71
LDI r2, 30
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
