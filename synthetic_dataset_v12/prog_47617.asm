; DESCRIPTION: Places a purple line segment connecting (50, 140) to (246, 153).
; PLAN: r0=50(x1), r1=140(y1), r2=246(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 140
LDI r2, 246
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
