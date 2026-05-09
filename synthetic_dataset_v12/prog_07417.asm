; DESCRIPTION: Places a purple line segment connecting (264, 114) to (483, 225).
; PLAN: r0=264(x1), r1=114(y1), r2=483(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 114
LDI r2, 483
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
