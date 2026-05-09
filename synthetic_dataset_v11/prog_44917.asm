; DESCRIPTION: Places a green line segment connecting (73, 218) to (195, 2).
; PLAN: r0=73(x1), r1=218(y1), r2=195(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 218
LDI r2, 195
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
