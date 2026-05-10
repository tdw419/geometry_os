; DESCRIPTION: Places a yellow line segment connecting (409, 218) to (248, 237).
; PLAN: r0=409(x1), r1=218(y1), r2=248(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 218
LDI r2, 248
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
