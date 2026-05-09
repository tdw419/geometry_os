; DESCRIPTION: Draws a magenta rectangle at (322, 181) with width 112 and height 71.
; PLAN: r0=322(x), r1=181(y), r2=112(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 181
LDI r2, 112
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
