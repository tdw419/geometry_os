; DESCRIPTION: Draws a magenta rectangle at (141, 3) with width 111 and height 23.
; PLAN: r0=141(x), r1=3(y), r2=111(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 3
LDI r2, 111
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
