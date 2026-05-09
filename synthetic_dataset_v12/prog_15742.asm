; DESCRIPTION: Composite: Renders a white disk with center (216, 153) and radius 60 then Renders a black line between points (267, 200) and (170, 200).
; PLAN: r0=216(x), r1=153(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=200(y1), r7=170(x2), r8=200(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 153
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 200
LDI r7, 170
LDI r8, 200
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
