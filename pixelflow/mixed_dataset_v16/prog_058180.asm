; DESCRIPTION: Places a blue line segment connecting (226, 253) to (55, 45).
; PLAN: r0=226(x1), r1=253(y1), r2=55(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 253
LDI r2, 55
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
