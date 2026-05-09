; DESCRIPTION: Places a black line segment connecting (235, 101) to (52, 106).
; PLAN: r0=235(x1), r1=101(y1), r2=52(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 101
LDI r2, 52
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
