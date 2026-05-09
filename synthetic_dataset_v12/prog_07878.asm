; DESCRIPTION: Places a blue line segment connecting (328, 45) to (462, 22).
; PLAN: r0=328(x1), r1=45(y1), r2=462(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 45
LDI r2, 462
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
