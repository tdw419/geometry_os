; DESCRIPTION: Places a yellow line segment connecting (202, 201) to (12, 141).
; PLAN: r0=202(x1), r1=201(y1), r2=12(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 201
LDI r2, 12
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
