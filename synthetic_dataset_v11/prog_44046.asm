; DESCRIPTION: Places a purple line segment connecting (207, 251) to (46, 199).
; PLAN: r0=207(x1), r1=251(y1), r2=46(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 251
LDI r2, 46
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
