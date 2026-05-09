; DESCRIPTION: Places a yellow line segment connecting (355, 90) to (110, 16).
; PLAN: r0=355(x1), r1=90(y1), r2=110(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 90
LDI r2, 110
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
