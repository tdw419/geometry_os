; DESCRIPTION: Places a black line segment connecting (10, 100) to (229, 93).
; PLAN: r0=10(x1), r1=100(y1), r2=229(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 100
LDI r2, 229
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
