; DESCRIPTION: Places a black line segment connecting (247, 113) to (149, 223).
; PLAN: r0=247(x1), r1=113(y1), r2=149(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 113
LDI r2, 149
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
