; DESCRIPTION: Draws a magenta rectangle at (212, 121) with width 74 and height 45.
; PLAN: r0=212(x), r1=121(y), r2=74(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 121
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
