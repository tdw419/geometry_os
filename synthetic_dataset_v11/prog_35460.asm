; DESCRIPTION: Places a green line segment connecting (149, 43) to (223, 58).
; PLAN: r0=149(x1), r1=43(y1), r2=223(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 43
LDI r2, 223
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
