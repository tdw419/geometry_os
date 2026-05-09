; DESCRIPTION: Places a purple line segment connecting (235, 22) to (189, 187).
; PLAN: r0=235(x1), r1=22(y1), r2=189(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 22
LDI r2, 189
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
