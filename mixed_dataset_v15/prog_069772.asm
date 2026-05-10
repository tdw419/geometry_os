; DESCRIPTION: Renders a blue rectangular region spanning 106 by 22 at (121, 116).
; PLAN: r0=121(x), r1=116(y), r2=106(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 116
LDI r2, 106
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
