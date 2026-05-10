; DESCRIPTION: Renders a white line between points (372, 18) and (201, 254).
; PLAN: r0=372(x1), r1=18(y1), r2=201(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 18
LDI r2, 201
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
