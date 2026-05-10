; DESCRIPTION: Places a black line segment connecting (102, 184) to (341, 168).
; PLAN: r0=102(x1), r1=184(y1), r2=341(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 184
LDI r2, 341
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
