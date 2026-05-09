; DESCRIPTION: Places a yellow line segment connecting (438, 60) to (326, 89).
; PLAN: r0=438(x1), r1=60(y1), r2=326(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 60
LDI r2, 326
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
