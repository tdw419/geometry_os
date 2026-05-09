; DESCRIPTION: Draws a magenta rectangle at (215, 1) with width 92 and height 108.
; PLAN: r0=215(x), r1=1(y), r2=92(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 1
LDI r2, 92
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
