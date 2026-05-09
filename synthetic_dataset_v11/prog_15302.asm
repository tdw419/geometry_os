; DESCRIPTION: Places a black line segment connecting (227, 188) to (235, 134).
; PLAN: r0=227(x1), r1=188(y1), r2=235(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 188
LDI r2, 235
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
