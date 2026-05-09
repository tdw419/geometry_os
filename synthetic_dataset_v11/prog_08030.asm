; DESCRIPTION: Places a purple line segment connecting (235, 139) to (131, 185).
; PLAN: r0=235(x1), r1=139(y1), r2=131(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 139
LDI r2, 131
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
