; DESCRIPTION: Places a blue line segment connecting (274, 9) to (234, 200).
; PLAN: r0=274(x1), r1=9(y1), r2=234(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 9
LDI r2, 234
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
