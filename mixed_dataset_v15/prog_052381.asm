; DESCRIPTION: Places a yellow line segment connecting (89, 103) to (483, 114).
; PLAN: r0=89(x1), r1=103(y1), r2=483(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 103
LDI r2, 483
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
