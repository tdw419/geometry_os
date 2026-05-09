; DESCRIPTION: Places a yellow line segment connecting (201, 164) to (178, 112).
; PLAN: r0=201(x1), r1=164(y1), r2=178(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 164
LDI r2, 178
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
