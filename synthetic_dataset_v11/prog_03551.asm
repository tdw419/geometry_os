; DESCRIPTION: Composite: . Then Places a purple line segment connecting (247, 101) to (167, 5). Then Draws a black circle centered at (77, 148) with radius 71.
; PLAN: r0=247(x1), r1=101(y1), r2=167(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=148(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (247, 101) to (167, 5).
; PLAN: r0=247(x1), r1=101(y1), r2=167(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 101
LDI r2, 167
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (77, 148) with radius 71.
; PLAN: r0=77(x), r1=148(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 148
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
