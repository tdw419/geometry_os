; DESCRIPTION: Places a yellow line segment connecting (235, 14) to (78, 138).
; PLAN: r0=235(x1), r1=14(y1), r2=78(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 14
LDI r2, 78
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
