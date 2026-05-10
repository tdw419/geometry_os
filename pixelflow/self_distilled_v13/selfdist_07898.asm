; DESCRIPTION: Renders a magenta rectangular region spanning 69 by 74 at (232, 133).
; PLAN: r0=232(x), r1=133(y), r2=69(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 133
LDI r2, 69
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
