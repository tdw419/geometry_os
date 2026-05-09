; DESCRIPTION: Places a purple line segment connecting (70, 127) to (238, 217).
; PLAN: r0=70(x1), r1=127(y1), r2=238(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 127
LDI r2, 238
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
