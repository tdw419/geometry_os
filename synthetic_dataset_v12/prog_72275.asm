; DESCRIPTION: Places a yellow line segment connecting (363, 189) to (208, 129).
; PLAN: r0=363(x1), r1=189(y1), r2=208(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 189
LDI r2, 208
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
