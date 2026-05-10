; DESCRIPTION: Places a yellow line segment connecting (355, 32) to (115, 234).
; PLAN: r0=355(x1), r1=32(y1), r2=115(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 32
LDI r2, 115
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
