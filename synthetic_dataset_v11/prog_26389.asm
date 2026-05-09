; DESCRIPTION: Places a purple line segment connecting (9, 197) to (66, 250).
; PLAN: r0=9(x1), r1=197(y1), r2=66(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 197
LDI r2, 66
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
