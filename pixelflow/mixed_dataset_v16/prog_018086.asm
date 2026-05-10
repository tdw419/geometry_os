; DESCRIPTION: Draws a magenta rectangle at (92, 116) with width 52 and height 53.
; PLAN: r0=92(x), r1=116(y), r2=52(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 116
LDI r2, 52
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
