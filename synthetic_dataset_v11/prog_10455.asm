; DESCRIPTION: Renders a green line between points (201, 125) and (53, 247).
; PLAN: r0=201(x1), r1=125(y1), r2=53(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 125
LDI r2, 53
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
