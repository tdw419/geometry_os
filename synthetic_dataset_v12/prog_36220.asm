; DESCRIPTION: Renders a white line between points (496, 70) and (71, 201).
; PLAN: r0=496(x1), r1=70(y1), r2=71(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 70
LDI r2, 71
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
