; DESCRIPTION: Places a orange line segment connecting (80, 74) to (120, 168).
; PLAN: r0=80(x1), r1=74(y1), r2=120(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 74
LDI r2, 120
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
