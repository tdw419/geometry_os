; DESCRIPTION: Places a yellow line segment connecting (156, 201) to (277, 167).
; PLAN: r0=156(x1), r1=201(y1), r2=277(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 201
LDI r2, 277
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
