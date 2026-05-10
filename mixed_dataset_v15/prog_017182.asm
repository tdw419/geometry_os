; DESCRIPTION: Places a yellow line segment connecting (312, 119) to (194, 242).
; PLAN: r0=312(x1), r1=119(y1), r2=194(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 119
LDI r2, 194
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
