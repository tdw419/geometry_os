; DESCRIPTION: Places a purple line segment connecting (116, 159) to (119, 134).
; PLAN: r0=116(x1), r1=159(y1), r2=119(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 159
LDI r2, 119
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
