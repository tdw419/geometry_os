; DESCRIPTION: Places a purple line segment connecting (485, 169) to (1, 193).
; PLAN: r0=485(x1), r1=169(y1), r2=1(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 169
LDI r2, 1
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
