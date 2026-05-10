; DESCRIPTION: Draws a magenta rectangle at (69, 6) with width 40 and height 112.
; PLAN: r0=69(x), r1=6(y), r2=40(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 6
LDI r2, 40
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
