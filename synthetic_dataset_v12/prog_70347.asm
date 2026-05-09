; DESCRIPTION: Places a orange line segment connecting (337, 200) to (356, 121).
; PLAN: r0=337(x1), r1=200(y1), r2=356(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 200
LDI r2, 356
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
