; DESCRIPTION: Places a red line segment connecting (325, 45) to (469, 81).
; PLAN: r0=325(x1), r1=45(y1), r2=469(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 45
LDI r2, 469
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
