; DESCRIPTION: Places a black line segment connecting (139, 214) to (19, 153).
; PLAN: r0=139(x1), r1=214(y1), r2=19(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 214
LDI r2, 19
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
