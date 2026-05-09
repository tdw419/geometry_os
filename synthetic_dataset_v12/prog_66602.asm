; DESCRIPTION: Places a purple line segment connecting (305, 11) to (340, 100).
; PLAN: r0=305(x1), r1=11(y1), r2=340(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 11
LDI r2, 340
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
