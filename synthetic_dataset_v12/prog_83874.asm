; DESCRIPTION: Places a blue line segment connecting (182, 1) to (374, 4).
; PLAN: r0=182(x1), r1=1(y1), r2=374(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 1
LDI r2, 374
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
