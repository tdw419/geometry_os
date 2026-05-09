; DESCRIPTION: Places a orange line segment connecting (201, 70) to (503, 190).
; PLAN: r0=201(x1), r1=70(y1), r2=503(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 70
LDI r2, 503
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
