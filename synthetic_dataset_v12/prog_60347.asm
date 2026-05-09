; DESCRIPTION: Places a yellow line segment connecting (279, 235) to (2, 8).
; PLAN: r0=279(x1), r1=235(y1), r2=2(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 235
LDI r2, 2
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
