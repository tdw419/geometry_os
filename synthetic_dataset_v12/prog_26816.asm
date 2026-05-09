; DESCRIPTION: Places a yellow line segment connecting (317, 137) to (153, 225).
; PLAN: r0=317(x1), r1=137(y1), r2=153(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 137
LDI r2, 153
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
