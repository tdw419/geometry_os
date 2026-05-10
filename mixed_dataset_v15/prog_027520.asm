; DESCRIPTION: Places a blue line segment connecting (65, 235) to (405, 147).
; PLAN: r0=65(x1), r1=235(y1), r2=405(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 235
LDI r2, 405
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
