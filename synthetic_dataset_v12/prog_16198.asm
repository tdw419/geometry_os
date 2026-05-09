; DESCRIPTION: Places a red line segment connecting (461, 11) to (325, 193).
; PLAN: r0=461(x1), r1=11(y1), r2=325(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 11
LDI r2, 325
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
