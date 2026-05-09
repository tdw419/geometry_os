; DESCRIPTION: Places a purple line segment connecting (24, 193) to (505, 253).
; PLAN: r0=24(x1), r1=193(y1), r2=505(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 193
LDI r2, 505
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
