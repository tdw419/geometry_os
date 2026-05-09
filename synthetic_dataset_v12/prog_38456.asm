; DESCRIPTION: Places a green line segment connecting (89, 17) to (326, 53).
; PLAN: r0=89(x1), r1=17(y1), r2=326(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 17
LDI r2, 326
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
