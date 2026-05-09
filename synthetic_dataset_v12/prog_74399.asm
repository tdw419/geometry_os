; DESCRIPTION: Places a purple line segment connecting (133, 146) to (306, 82).
; PLAN: r0=133(x1), r1=146(y1), r2=306(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 146
LDI r2, 306
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
