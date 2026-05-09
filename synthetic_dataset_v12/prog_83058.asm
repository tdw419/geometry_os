; DESCRIPTION: Draws a magenta rectangle at (11, 87) with width 113 and height 112.
; PLAN: r0=11(x), r1=87(y), r2=113(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 87
LDI r2, 113
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
