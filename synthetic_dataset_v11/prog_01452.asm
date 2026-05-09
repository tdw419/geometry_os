; DESCRIPTION: Draws a magenta rectangle at (141, 95) with width 30 and height 45.
; PLAN: r0=141(x), r1=95(y), r2=30(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 95
LDI r2, 30
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
