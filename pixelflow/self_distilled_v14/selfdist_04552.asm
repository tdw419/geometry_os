; DESCRIPTION: Renders a red rectangular region spanning 119 by 29 at (204, 78).
; PLAN: r0=204(x), r1=78(y), r2=119(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 78
LDI r2, 119
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
