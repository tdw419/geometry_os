; DESCRIPTION: Places a purple line segment connecting (166, 187) to (141, 176).
; PLAN: r0=166(x1), r1=187(y1), r2=141(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 187
LDI r2, 141
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
