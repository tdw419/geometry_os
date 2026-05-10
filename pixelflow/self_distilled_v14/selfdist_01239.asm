; DESCRIPTION: Renders a green rectangular region spanning 34 by 81 at (336, 165).
; PLAN: r0=336(x), r1=165(y), r2=34(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 165
LDI r2, 34
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
