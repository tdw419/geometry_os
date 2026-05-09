; DESCRIPTION: Places a yellow line segment connecting (235, 98) to (314, 156).
; PLAN: r0=235(x1), r1=98(y1), r2=314(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 98
LDI r2, 314
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
