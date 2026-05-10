; DESCRIPTION: Draws a green line from (414, 16) to (201, 147).
; PLAN: r0=414(x1), r1=16(y1), r2=201(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 16
LDI r2, 201
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
