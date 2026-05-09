; DESCRIPTION: Places a purple line segment connecting (184, 227) to (235, 12).
; PLAN: r0=184(x1), r1=227(y1), r2=235(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 227
LDI r2, 235
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
