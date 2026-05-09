; DESCRIPTION: Places a white line segment connecting (147, 156) to (18, 193).
; PLAN: r0=147(x1), r1=156(y1), r2=18(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 156
LDI r2, 18
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
