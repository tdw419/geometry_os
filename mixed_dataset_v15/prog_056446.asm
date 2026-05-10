; DESCRIPTION: Places a black line segment connecting (492, 131) to (377, 2).
; PLAN: r0=492(x1), r1=131(y1), r2=377(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 131
LDI r2, 377
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
