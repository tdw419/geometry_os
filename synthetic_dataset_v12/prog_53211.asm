; DESCRIPTION: Places a purple line segment connecting (137, 221) to (134, 179).
; PLAN: r0=137(x1), r1=221(y1), r2=134(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 221
LDI r2, 134
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
