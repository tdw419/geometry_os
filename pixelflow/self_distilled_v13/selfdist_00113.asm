; DESCRIPTION: Renders a green line segment connecting (201, 151) to (287, 32).
; PLAN: r0=201(x1), r1=151(y1), r2=287(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 151
LDI r2, 287
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
