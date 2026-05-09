; DESCRIPTION: Places a purple line segment connecting (307, 207) to (71, 84).
; PLAN: r0=307(x1), r1=207(y1), r2=71(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 207
LDI r2, 71
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
