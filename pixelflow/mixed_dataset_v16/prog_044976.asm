; DESCRIPTION: Renders a white box of size 49x118 starting at (314, 71).
; PLAN: r0=314(x), r1=71(y), r2=49(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 71
LDI r2, 49
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
