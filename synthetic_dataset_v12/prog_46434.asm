; DESCRIPTION: Places a blue line segment connecting (508, 1) to (262, 142).
; PLAN: r0=508(x1), r1=1(y1), r2=262(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 1
LDI r2, 262
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
