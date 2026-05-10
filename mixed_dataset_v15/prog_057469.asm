; DESCRIPTION: Places a green line segment connecting (431, 218) to (19, 204).
; PLAN: r0=431(x1), r1=218(y1), r2=19(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 218
LDI r2, 19
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
