; DESCRIPTION: Draws a magenta rectangle at (112, 143) with width 111 and height 94.
; PLAN: r0=112(x), r1=143(y), r2=111(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 143
LDI r2, 111
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
