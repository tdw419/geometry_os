; DESCRIPTION: Places a purple line segment connecting (88, 24) to (164, 235).
; PLAN: r0=88(x1), r1=24(y1), r2=164(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 24
LDI r2, 164
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
