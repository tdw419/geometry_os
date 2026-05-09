; DESCRIPTION: Draws a magenta rectangle at (92, 85) with width 67 and height 108.
; PLAN: r0=92(x), r1=85(y), r2=67(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 85
LDI r2, 67
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
