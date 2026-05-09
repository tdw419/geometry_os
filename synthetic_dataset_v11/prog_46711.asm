; DESCRIPTION: Places a orange line segment connecting (170, 180) to (112, 87).
; PLAN: r0=170(x1), r1=180(y1), r2=112(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 180
LDI r2, 112
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
