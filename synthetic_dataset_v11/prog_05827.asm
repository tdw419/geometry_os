; DESCRIPTION: Places a purple line segment connecting (66, 242) to (53, 116).
; PLAN: r0=66(x1), r1=242(y1), r2=53(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 242
LDI r2, 53
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
