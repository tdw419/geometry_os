; DESCRIPTION: Places a black line segment connecting (147, 202) to (48, 235).
; PLAN: r0=147(x1), r1=202(y1), r2=48(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 202
LDI r2, 48
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
