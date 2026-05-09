; DESCRIPTION: Draws a magenta rectangle at (376, 45) with width 95 and height 99.
; PLAN: r0=376(x), r1=45(y), r2=95(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 45
LDI r2, 95
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
