; DESCRIPTION: Places a red line segment connecting (316, 10) to (393, 84).
; PLAN: r0=316(x1), r1=10(y1), r2=393(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 10
LDI r2, 393
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
