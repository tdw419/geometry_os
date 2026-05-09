; DESCRIPTION: Composite: . Then Renders a red disk with center (199, 130) and radius 47. Then Places a white line segment connecting (140, 41) to (201, 99).
; PLAN: r0=199(x), r1=130(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=140(x1), r1=41(y1), r2=201(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (199, 130) and radius 47.
; PLAN: r0=199(x), r1=130(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 130
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (140, 41) to (201, 99).
; PLAN: r0=140(x1), r1=41(y1), r2=201(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 41
LDI r2, 201
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
