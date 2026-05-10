; DESCRIPTION: Places a blue line segment connecting (506, 254) to (130, 15).
; PLAN: r0=506(x1), r1=254(y1), r2=130(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 254
LDI r2, 130
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
