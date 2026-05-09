; DESCRIPTION: Places a yellow line segment connecting (331, 218) to (154, 137).
; PLAN: r0=331(x1), r1=218(y1), r2=154(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 218
LDI r2, 154
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
