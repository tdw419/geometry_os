; DESCRIPTION: Places a green line segment connecting (223, 156) to (477, 142).
; PLAN: r0=223(x1), r1=156(y1), r2=477(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 156
LDI r2, 477
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
