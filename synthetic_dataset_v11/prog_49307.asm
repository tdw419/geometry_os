; DESCRIPTION: Places a blue line segment connecting (45, 193) to (189, 48).
; PLAN: r0=45(x1), r1=193(y1), r2=189(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 193
LDI r2, 189
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
