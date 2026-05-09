; DESCRIPTION: Renders a green line between points (168, 201) and (175, 11).
; PLAN: r0=168(x1), r1=201(y1), r2=175(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 201
LDI r2, 175
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
