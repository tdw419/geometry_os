; DESCRIPTION: Places a green line segment connecting (235, 76) to (140, 22).
; PLAN: r0=235(x1), r1=76(y1), r2=140(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 76
LDI r2, 140
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
