; DESCRIPTION: Places a purple line segment connecting (189, 221) to (40, 11).
; PLAN: r0=189(x1), r1=221(y1), r2=40(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 221
LDI r2, 40
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
