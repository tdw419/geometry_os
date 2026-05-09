; DESCRIPTION: Places a red line segment connecting (375, 233) to (458, 84).
; PLAN: r0=375(x1), r1=233(y1), r2=458(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 233
LDI r2, 458
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
