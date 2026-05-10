; DESCRIPTION: Places a red line segment connecting (23, 74) to (161, 110).
; PLAN: r0=23(x1), r1=74(y1), r2=161(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 74
LDI r2, 161
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
