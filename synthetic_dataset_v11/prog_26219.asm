; DESCRIPTION: Places a black line segment connecting (85, 147) to (235, 127).
; PLAN: r0=85(x1), r1=147(y1), r2=235(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 147
LDI r2, 235
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
