; DESCRIPTION: Places a yellow line segment connecting (478, 79) to (419, 225).
; PLAN: r0=478(x1), r1=79(y1), r2=419(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 79
LDI r2, 419
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
