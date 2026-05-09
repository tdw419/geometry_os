; DESCRIPTION: Places a white line segment connecting (510, 55) to (56, 147).
; PLAN: r0=510(x1), r1=55(y1), r2=56(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 55
LDI r2, 56
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
