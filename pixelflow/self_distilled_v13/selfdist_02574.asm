; DESCRIPTION: Renders a green rectangular region spanning 49 by 24 at (191, 116).
; PLAN: r0=191(x), r1=116(y), r2=49(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 116
LDI r2, 49
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
