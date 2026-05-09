; DESCRIPTION: Places a white line segment connecting (8, 3) to (36, 147).
; PLAN: r0=8(x1), r1=3(y1), r2=36(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 3
LDI r2, 36
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
