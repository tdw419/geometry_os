; DESCRIPTION: Places a red line segment connecting (251, 3) to (469, 82).
; PLAN: r0=251(x1), r1=3(y1), r2=469(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 3
LDI r2, 469
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
