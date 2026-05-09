; DESCRIPTION: Places a green line segment connecting (483, 11) to (26, 225).
; PLAN: r0=483(x1), r1=11(y1), r2=26(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 11
LDI r2, 26
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
