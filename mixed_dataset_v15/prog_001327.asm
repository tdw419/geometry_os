; DESCRIPTION: Places a orange line segment connecting (141, 146) to (161, 84).
; PLAN: r0=141(x1), r1=146(y1), r2=161(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 146
LDI r2, 161
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
