; DESCRIPTION: Places a orange line segment connecting (142, 95) to (196, 193).
; PLAN: r0=142(x1), r1=95(y1), r2=196(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 95
LDI r2, 196
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
