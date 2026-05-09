; DESCRIPTION: Draws a magenta rectangle at (115, 3) with width 112 and height 58.
; PLAN: r0=115(x), r1=3(y), r2=112(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 3
LDI r2, 112
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
