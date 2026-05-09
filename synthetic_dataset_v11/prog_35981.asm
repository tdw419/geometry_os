; DESCRIPTION: Places a blue line segment connecting (1, 3) to (100, 253).
; PLAN: r0=1(x1), r1=3(y1), r2=100(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 3
LDI r2, 100
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
