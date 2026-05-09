; DESCRIPTION: Places a red line segment connecting (469, 199) to (484, 161).
; PLAN: r0=469(x1), r1=199(y1), r2=484(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 199
LDI r2, 484
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
