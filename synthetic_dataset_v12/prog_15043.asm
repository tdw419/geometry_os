; DESCRIPTION: Places a purple line segment connecting (14, 235) to (462, 202).
; PLAN: r0=14(x1), r1=235(y1), r2=462(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 235
LDI r2, 462
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
