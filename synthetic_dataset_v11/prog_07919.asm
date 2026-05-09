; DESCRIPTION: Composite: . Then Draws a red line from (172, 185) to (45, 130). Then Renders a yellow disk with center (148, 155) and radius 66.
; PLAN: r0=172(x1), r1=185(y1), r2=45(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=148(x), r1=155(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (172, 185) to (45, 130).
; PLAN: r0=172(x1), r1=185(y1), r2=45(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 185
LDI r2, 45
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (148, 155) and radius 66.
; PLAN: r0=148(x), r1=155(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 155
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
