; DESCRIPTION: Places a black line segment connecting (147, 235) to (69, 13).
; PLAN: r0=147(x1), r1=235(y1), r2=69(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 235
LDI r2, 69
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
