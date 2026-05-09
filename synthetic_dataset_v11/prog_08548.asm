; DESCRIPTION: Places a purple line segment connecting (237, 171) to (101, 225).
; PLAN: r0=237(x1), r1=171(y1), r2=101(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 171
LDI r2, 101
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
