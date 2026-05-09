; DESCRIPTION: Places a blue line segment connecting (340, 169) to (100, 193).
; PLAN: r0=340(x1), r1=169(y1), r2=100(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 169
LDI r2, 100
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
