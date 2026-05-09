; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (89, 11) to (64, 248). Then Renders a white disk with center (137, 91) and radius 12.
; PLAN: r0=89(x1), r1=11(y1), r2=64(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=137(x), r1=91(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (89, 11) to (64, 248).
; PLAN: r0=89(x1), r1=11(y1), r2=64(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 11
LDI r2, 64
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (137, 91) and radius 12.
; PLAN: r0=137(x), r1=91(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 91
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
