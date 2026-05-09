; DESCRIPTION: Places a blue line segment connecting (265, 137) to (506, 40).
; PLAN: r0=265(x1), r1=137(y1), r2=506(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 137
LDI r2, 506
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
