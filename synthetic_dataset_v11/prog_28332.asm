; DESCRIPTION: Places a green line segment connecting (159, 11) to (235, 244).
; PLAN: r0=159(x1), r1=11(y1), r2=235(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 11
LDI r2, 235
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
