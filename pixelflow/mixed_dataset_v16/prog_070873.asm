; DESCRIPTION: Places a yellow line segment connecting (428, 218) to (508, 83).
; PLAN: r0=428(x1), r1=218(y1), r2=508(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 218
LDI r2, 508
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
