; DESCRIPTION: Renders a green line between points (129, 230) and (201, 68).
; PLAN: r0=129(x1), r1=230(y1), r2=201(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 230
LDI r2, 201
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
