; DESCRIPTION: Places a orange line segment connecting (226, 238) to (115, 121).
; PLAN: r0=226(x1), r1=238(y1), r2=115(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 238
LDI r2, 115
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
