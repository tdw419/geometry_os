; DESCRIPTION: Places a orange line segment connecting (143, 0) to (294, 201).
; PLAN: r0=143(x1), r1=0(y1), r2=294(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 294
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
