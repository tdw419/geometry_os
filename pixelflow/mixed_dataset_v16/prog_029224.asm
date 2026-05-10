; DESCRIPTION: Places a blue line segment connecting (266, 186) to (324, 241).
; PLAN: r0=266(x1), r1=186(y1), r2=324(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 186
LDI r2, 324
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
