; DESCRIPTION: Places a purple line segment connecting (235, 126) to (221, 200).
; PLAN: r0=235(x1), r1=126(y1), r2=221(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 126
LDI r2, 221
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
