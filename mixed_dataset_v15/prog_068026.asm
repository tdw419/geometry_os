; DESCRIPTION: Places a yellow line segment connecting (419, 185) to (59, 76).
; PLAN: r0=419(x1), r1=185(y1), r2=59(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 185
LDI r2, 59
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
