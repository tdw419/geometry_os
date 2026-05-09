; DESCRIPTION: Places a red line segment connecting (241, 44) to (316, 227).
; PLAN: r0=241(x1), r1=44(y1), r2=316(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 44
LDI r2, 316
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
