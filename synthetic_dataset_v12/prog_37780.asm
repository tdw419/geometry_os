; DESCRIPTION: Places a orange line segment connecting (216, 225) to (121, 100).
; PLAN: r0=216(x1), r1=225(y1), r2=121(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 225
LDI r2, 121
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
