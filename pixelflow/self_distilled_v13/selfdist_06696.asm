; DESCRIPTION: Draws a magenta rectangle at (383, 14) with width 15 and height 111.
; PLAN: r0=383(x), r1=14(y), r2=15(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 14
LDI r2, 15
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
