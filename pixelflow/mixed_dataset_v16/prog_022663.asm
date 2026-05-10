; DESCRIPTION: Places a black line segment connecting (345, 34) to (417, 84).
; PLAN: r0=345(x1), r1=34(y1), r2=417(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 34
LDI r2, 417
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
