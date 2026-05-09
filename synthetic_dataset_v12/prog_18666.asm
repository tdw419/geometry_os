; DESCRIPTION: Places a blue line segment connecting (43, 45) to (444, 58).
; PLAN: r0=43(x1), r1=45(y1), r2=444(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 45
LDI r2, 444
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
