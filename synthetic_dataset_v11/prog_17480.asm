; DESCRIPTION: Places a purple line segment connecting (225, 39) to (144, 79).
; PLAN: r0=225(x1), r1=39(y1), r2=144(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 39
LDI r2, 144
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
