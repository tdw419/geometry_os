; DESCRIPTION: Places a red line segment connecting (102, 103) to (78, 110).
; PLAN: r0=102(x1), r1=103(y1), r2=78(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 103
LDI r2, 78
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
