; DESCRIPTION: Places a orange line segment connecting (458, 21) to (341, 200).
; PLAN: r0=458(x1), r1=21(y1), r2=341(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 21
LDI r2, 341
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
