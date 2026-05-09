; DESCRIPTION: Places a black line segment connecting (121, 171) to (89, 89).
; PLAN: r0=121(x1), r1=171(y1), r2=89(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 171
LDI r2, 89
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
