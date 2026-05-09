; DESCRIPTION: Composite: Places a black line segment connecting (158, 153) to (91, 174) then Renders a green disk with center (216, 77) and radius 37.
; PLAN: r0=158(x1), r1=153(y1), r2=91(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=77(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 153
LDI r2, 91
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 77
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
