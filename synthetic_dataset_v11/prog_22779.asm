; DESCRIPTION: Places a purple line segment connecting (40, 208) to (212, 197).
; PLAN: r0=40(x1), r1=208(y1), r2=212(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 208
LDI r2, 212
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
