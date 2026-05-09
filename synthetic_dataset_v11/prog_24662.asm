; DESCRIPTION: Draws a magenta rectangle at (73, 124) with width 114 and height 46.
; PLAN: r0=73(x), r1=124(y), r2=114(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 124
LDI r2, 114
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
