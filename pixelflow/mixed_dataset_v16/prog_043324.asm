; DESCRIPTION: Places a blue line segment connecting (381, 254) to (478, 195).
; PLAN: r0=381(x1), r1=254(y1), r2=478(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 254
LDI r2, 478
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
