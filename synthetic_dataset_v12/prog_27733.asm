; DESCRIPTION: Places a black line segment connecting (407, 238) to (443, 89).
; PLAN: r0=407(x1), r1=238(y1), r2=443(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 238
LDI r2, 443
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
