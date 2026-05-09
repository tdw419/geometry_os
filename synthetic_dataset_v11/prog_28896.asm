; DESCRIPTION: Places a orange line segment connecting (170, 222) to (73, 168).
; PLAN: r0=170(x1), r1=222(y1), r2=73(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 222
LDI r2, 73
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
