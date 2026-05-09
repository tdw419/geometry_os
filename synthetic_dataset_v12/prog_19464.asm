; DESCRIPTION: Places a yellow line segment connecting (125, 167) to (483, 85).
; PLAN: r0=125(x1), r1=167(y1), r2=483(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 167
LDI r2, 483
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
