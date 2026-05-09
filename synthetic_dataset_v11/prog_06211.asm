; DESCRIPTION: Places a blue line segment connecting (92, 75) to (235, 240).
; PLAN: r0=92(x1), r1=75(y1), r2=235(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 75
LDI r2, 235
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
