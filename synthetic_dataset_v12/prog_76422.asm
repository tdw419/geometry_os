; DESCRIPTION: Places a red line segment connecting (385, 95) to (312, 56).
; PLAN: r0=385(x1), r1=95(y1), r2=312(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 95
LDI r2, 312
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
