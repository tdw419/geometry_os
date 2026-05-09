; DESCRIPTION: Places a purple line segment connecting (212, 59) to (7, 220).
; PLAN: r0=212(x1), r1=59(y1), r2=7(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 59
LDI r2, 7
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
