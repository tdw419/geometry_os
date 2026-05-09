; DESCRIPTION: Draws a magenta rectangle at (141, 128) with width 92 and height 58.
; PLAN: r0=141(x), r1=128(y), r2=92(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 128
LDI r2, 92
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
