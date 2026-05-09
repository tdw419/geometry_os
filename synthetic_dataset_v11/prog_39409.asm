; DESCRIPTION: Places a white line segment connecting (192, 99) to (34, 133).
; PLAN: r0=192(x1), r1=99(y1), r2=34(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 99
LDI r2, 34
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
