; DESCRIPTION: Composite: . Then Draws a white line from (94, 183) to (95, 201). Then Renders a orange disk with center (130, 83) and radius 54.
; PLAN: r0=94(x1), r1=183(y1), r2=95(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=130(x), r1=83(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (94, 183) to (95, 201).
; PLAN: r0=94(x1), r1=183(y1), r2=95(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 183
LDI r2, 95
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (130, 83) and radius 54.
; PLAN: r0=130(x), r1=83(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 83
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
