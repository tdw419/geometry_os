; DESCRIPTION: Places a blue line segment connecting (192, 137) to (150, 1).
; PLAN: r0=192(x1), r1=137(y1), r2=150(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 137
LDI r2, 150
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
