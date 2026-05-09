; DESCRIPTION: Composite: . Then Renders a white line between points (31, 198) and (107, 207). Then Renders a yellow disk with center (18, 200) and radius 13.
; PLAN: r0=31(x1), r1=198(y1), r2=107(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=200(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (31, 198) and (107, 207).
; PLAN: r0=31(x1), r1=198(y1), r2=107(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 198
LDI r2, 107
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (18, 200) and radius 13.
; PLAN: r0=18(x), r1=200(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 200
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
