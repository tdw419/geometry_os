; DESCRIPTION: Renders a blue rectangular region spanning 102 by 53 at (121, 199).
; PLAN: r0=121(x), r1=199(y), r2=102(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 199
LDI r2, 102
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
