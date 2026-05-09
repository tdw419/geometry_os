; DESCRIPTION: Draws a magenta rectangle at (71, 1) with width 112 and height 107.
; PLAN: r0=71(x), r1=1(y), r2=112(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 1
LDI r2, 112
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
