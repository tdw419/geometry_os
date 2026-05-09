; DESCRIPTION: Places a blue line segment connecting (87, 114) to (137, 110).
; PLAN: r0=87(x1), r1=114(y1), r2=137(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 114
LDI r2, 137
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
