; DESCRIPTION: Places a purple line segment connecting (212, 72) to (330, 115).
; PLAN: r0=212(x1), r1=72(y1), r2=330(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 72
LDI r2, 330
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
