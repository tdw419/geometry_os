; DESCRIPTION: Places a black line segment connecting (200, 103) to (142, 58).
; PLAN: r0=200(x1), r1=103(y1), r2=142(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 103
LDI r2, 142
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
