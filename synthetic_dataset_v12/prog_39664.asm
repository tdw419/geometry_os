; DESCRIPTION: Places a purple line segment connecting (144, 84) to (368, 18).
; PLAN: r0=144(x1), r1=84(y1), r2=368(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 84
LDI r2, 368
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
