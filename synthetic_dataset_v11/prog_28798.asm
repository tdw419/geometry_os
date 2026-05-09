; DESCRIPTION: Places a black line segment connecting (80, 102) to (29, 233).
; PLAN: r0=80(x1), r1=102(y1), r2=29(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 102
LDI r2, 29
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
