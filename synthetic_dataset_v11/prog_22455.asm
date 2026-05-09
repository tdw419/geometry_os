; DESCRIPTION: Places a black line segment connecting (38, 3) to (160, 53).
; PLAN: r0=38(x1), r1=3(y1), r2=160(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 3
LDI r2, 160
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
