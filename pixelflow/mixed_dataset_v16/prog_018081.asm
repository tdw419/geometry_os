; DESCRIPTION: Places a blue line segment connecting (347, 253) to (418, 197).
; PLAN: r0=347(x1), r1=253(y1), r2=418(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 253
LDI r2, 418
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
