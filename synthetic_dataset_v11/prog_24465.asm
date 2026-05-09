; DESCRIPTION: Places a yellow line segment connecting (253, 112) to (174, 235).
; PLAN: r0=253(x1), r1=112(y1), r2=174(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 112
LDI r2, 174
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
