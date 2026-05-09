; DESCRIPTION: Places a purple line segment connecting (196, 47) to (225, 39).
; PLAN: r0=196(x1), r1=47(y1), r2=225(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 47
LDI r2, 225
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
