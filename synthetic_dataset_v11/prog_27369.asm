; DESCRIPTION: Composite: . Then Renders a yellow line between points (137, 215) and (111, 130). Then Renders a yellow disk with center (100, 140) and radius 69.
; PLAN: r0=137(x1), r1=215(y1), r2=111(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=140(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (137, 215) and (111, 130).
; PLAN: r0=137(x1), r1=215(y1), r2=111(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 215
LDI r2, 111
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (100, 140) and radius 69.
; PLAN: r0=100(x), r1=140(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 140
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
