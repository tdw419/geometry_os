; DESCRIPTION: Draws a magenta rectangle at (143, 138) with width 63 and height 111.
; PLAN: r0=143(x), r1=138(y), r2=63(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 138
LDI r2, 63
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
