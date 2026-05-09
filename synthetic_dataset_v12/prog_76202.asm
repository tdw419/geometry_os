; DESCRIPTION: Places a red line segment connecting (312, 80) to (125, 40).
; PLAN: r0=312(x1), r1=80(y1), r2=125(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 80
LDI r2, 125
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
