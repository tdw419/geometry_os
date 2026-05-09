; DESCRIPTION: Draws a magenta rectangle at (215, 73) with width 18 and height 92.
; PLAN: r0=215(x), r1=73(y), r2=18(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 73
LDI r2, 18
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
