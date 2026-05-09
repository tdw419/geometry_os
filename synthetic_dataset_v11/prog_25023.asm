; DESCRIPTION: Places a blue line segment connecting (137, 83) to (143, 241).
; PLAN: r0=137(x1), r1=83(y1), r2=143(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 83
LDI r2, 143
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
