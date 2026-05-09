; DESCRIPTION: Places a yellow line segment connecting (472, 237) to (321, 66).
; PLAN: r0=472(x1), r1=237(y1), r2=321(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 237
LDI r2, 321
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
