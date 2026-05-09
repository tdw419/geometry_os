; DESCRIPTION: Places a green line segment connecting (159, 169) to (235, 198).
; PLAN: r0=159(x1), r1=169(y1), r2=235(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 169
LDI r2, 235
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
