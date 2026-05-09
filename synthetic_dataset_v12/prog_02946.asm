; DESCRIPTION: Places a yellow line segment connecting (137, 237) to (317, 144).
; PLAN: r0=137(x1), r1=237(y1), r2=317(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 237
LDI r2, 317
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
