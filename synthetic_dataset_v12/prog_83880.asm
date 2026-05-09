; DESCRIPTION: Places a red line segment connecting (469, 98) to (466, 77).
; PLAN: r0=469(x1), r1=98(y1), r2=466(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 98
LDI r2, 466
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
