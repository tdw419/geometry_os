; DESCRIPTION: Places a green line segment connecting (223, 15) to (244, 71).
; PLAN: r0=223(x1), r1=15(y1), r2=244(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 15
LDI r2, 244
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
