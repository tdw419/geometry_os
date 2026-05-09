; DESCRIPTION: Places a green line segment connecting (66, 147) to (339, 66).
; PLAN: r0=66(x1), r1=147(y1), r2=339(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 147
LDI r2, 339
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
