; DESCRIPTION: Places a green line segment connecting (149, 61) to (254, 119).
; PLAN: r0=149(x1), r1=61(y1), r2=254(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 61
LDI r2, 254
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
