; DESCRIPTION: Places a purple line segment connecting (212, 44) to (346, 181).
; PLAN: r0=212(x1), r1=44(y1), r2=346(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 44
LDI r2, 346
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
