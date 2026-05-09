; DESCRIPTION: Places a orange line segment connecting (351, 242) to (439, 1).
; PLAN: r0=351(x1), r1=242(y1), r2=439(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 242
LDI r2, 439
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
