; DESCRIPTION: Places a blue line segment connecting (195, 135) to (266, 211).
; PLAN: r0=195(x1), r1=135(y1), r2=266(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 135
LDI r2, 266
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
