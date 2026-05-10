; DESCRIPTION: Places a yellow line segment connecting (93, 121) to (110, 90).
; PLAN: r0=93(x1), r1=121(y1), r2=110(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 121
LDI r2, 110
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
