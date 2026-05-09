; DESCRIPTION: Draws a magenta rectangle at (95, 61) with width 92 and height 65.
; PLAN: r0=95(x), r1=61(y), r2=92(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 61
LDI r2, 92
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
