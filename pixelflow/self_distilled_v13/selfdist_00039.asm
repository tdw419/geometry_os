; DESCRIPTION: Renders a yellow rectangular region spanning 71 by 61 at (233, 129).
; PLAN: r0=233(x), r1=129(y), r2=71(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 129
LDI r2, 71
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
