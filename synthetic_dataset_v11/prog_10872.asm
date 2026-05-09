; DESCRIPTION: Places a yellow line segment connecting (200, 235) to (143, 203).
; PLAN: r0=200(x1), r1=235(y1), r2=143(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 235
LDI r2, 143
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
