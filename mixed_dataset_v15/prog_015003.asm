; DESCRIPTION: Places a yellow line segment connecting (316, 63) to (241, 200).
; PLAN: r0=316(x1), r1=63(y1), r2=241(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 63
LDI r2, 241
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
