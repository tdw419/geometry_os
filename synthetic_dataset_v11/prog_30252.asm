; DESCRIPTION: Draws a magenta rectangle at (86, 73) with width 111 and height 87.
; PLAN: r0=86(x), r1=73(y), r2=111(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 73
LDI r2, 111
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
