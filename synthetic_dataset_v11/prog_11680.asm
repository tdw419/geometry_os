; DESCRIPTION: Places a purple line segment connecting (4, 226) to (241, 254).
; PLAN: r0=4(x1), r1=226(y1), r2=241(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 226
LDI r2, 241
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
