; DESCRIPTION: Places a black line segment connecting (142, 160) to (2, 16).
; PLAN: r0=142(x1), r1=160(y1), r2=2(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 160
LDI r2, 2
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
