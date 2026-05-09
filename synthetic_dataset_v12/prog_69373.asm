; DESCRIPTION: Places a purple line segment connecting (109, 154) to (314, 204).
; PLAN: r0=109(x1), r1=154(y1), r2=314(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 154
LDI r2, 314
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
