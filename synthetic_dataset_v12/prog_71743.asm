; DESCRIPTION: Renders a green line between points (133, 201) and (422, 187).
; PLAN: r0=133(x1), r1=201(y1), r2=422(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 201
LDI r2, 422
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
