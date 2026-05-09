; DESCRIPTION: Composite: . Then Renders a blue box of size 62x96 starting at (189, 119). Then Creates a purple circular shape at (99, 107) with radius 71.
; PLAN: r0=189(x), r1=119(y), r2=62(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=99(x), r1=107(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 62x96 starting at (189, 119).
; PLAN: r0=189(x), r1=119(y), r2=62(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 119
LDI r2, 62
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (99, 107) with radius 71.
; PLAN: r0=99(x), r1=107(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 107
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
