; DESCRIPTION: Places a blue line segment connecting (388, 87) to (23, 55).
; PLAN: r0=388(x1), r1=87(y1), r2=23(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 87
LDI r2, 23
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
