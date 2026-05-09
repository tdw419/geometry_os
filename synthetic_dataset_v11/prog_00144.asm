; DESCRIPTION: Places a purple line segment connecting (176, 18) to (59, 181).
; PLAN: r0=176(x1), r1=18(y1), r2=59(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 18
LDI r2, 59
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
