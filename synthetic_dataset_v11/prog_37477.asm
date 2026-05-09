; DESCRIPTION: Places a purple line segment connecting (246, 82) to (48, 49).
; PLAN: r0=246(x1), r1=82(y1), r2=48(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 82
LDI r2, 48
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
