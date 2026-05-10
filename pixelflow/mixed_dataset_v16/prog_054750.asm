; DESCRIPTION: Places a orange line segment connecting (325, 98) to (413, 237).
; PLAN: r0=325(x1), r1=98(y1), r2=413(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 98
LDI r2, 413
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
