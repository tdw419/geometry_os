; DESCRIPTION: Renders a green rectangular region spanning 102 by 24 at (232, 112).
; PLAN: r0=232(x), r1=112(y), r2=102(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 112
LDI r2, 102
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
