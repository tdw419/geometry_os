; DESCRIPTION: Places a blue line segment connecting (454, 193) to (294, 137).
; PLAN: r0=454(x1), r1=193(y1), r2=294(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 193
LDI r2, 294
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
