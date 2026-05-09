; DESCRIPTION: Places a black line segment connecting (137, 235) to (84, 240).
; PLAN: r0=137(x1), r1=235(y1), r2=84(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 235
LDI r2, 84
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
