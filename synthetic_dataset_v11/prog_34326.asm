; DESCRIPTION: Places a purple line segment connecting (164, 233) to (108, 241).
; PLAN: r0=164(x1), r1=233(y1), r2=108(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 233
LDI r2, 108
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
