; DESCRIPTION: Places a yellow line segment connecting (64, 151) to (355, 234).
; PLAN: r0=64(x1), r1=151(y1), r2=355(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 151
LDI r2, 355
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
