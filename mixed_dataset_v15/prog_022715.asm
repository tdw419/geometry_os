; DESCRIPTION: Renders a magenta rectangular region spanning 118 by 113 at (108, 58).
; PLAN: r0=108(x), r1=58(y), r2=118(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 58
LDI r2, 118
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
