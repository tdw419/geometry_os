; DESCRIPTION: Draws a magenta rectangle at (411, 92) with width 12 and height 85.
; PLAN: r0=411(x), r1=92(y), r2=12(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 92
LDI r2, 12
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
