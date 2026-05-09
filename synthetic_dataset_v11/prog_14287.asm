; DESCRIPTION: Composite: . Then Renders a black disk with center (147, 153) and radius 69. Then Renders a yellow line between points (139, 119) and (25, 33).
; PLAN: r0=147(x), r1=153(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x1), r1=119(y1), r2=25(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (147, 153) and radius 69.
; PLAN: r0=147(x), r1=153(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 153
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (139, 119) and (25, 33).
; PLAN: r0=139(x1), r1=119(y1), r2=25(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 119
LDI r2, 25
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
