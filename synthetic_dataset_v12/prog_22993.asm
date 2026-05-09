; DESCRIPTION: Draws a magenta rectangle at (182, 63) with width 49 and height 119.
; PLAN: r0=182(x), r1=63(y), r2=49(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 63
LDI r2, 49
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
