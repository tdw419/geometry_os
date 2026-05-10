; DESCRIPTION: Places a green line segment connecting (395, 110) to (355, 128).
; PLAN: r0=395(x1), r1=110(y1), r2=355(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 110
LDI r2, 355
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
