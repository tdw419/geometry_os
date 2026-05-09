; DESCRIPTION: Places a green line segment connecting (253, 158) to (235, 171).
; PLAN: r0=253(x1), r1=158(y1), r2=235(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 158
LDI r2, 235
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
