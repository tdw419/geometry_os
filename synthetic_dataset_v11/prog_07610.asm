; DESCRIPTION: Places a blue line segment connecting (254, 87) to (149, 45).
; PLAN: r0=254(x1), r1=87(y1), r2=149(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 87
LDI r2, 149
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
