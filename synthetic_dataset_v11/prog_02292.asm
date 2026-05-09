; DESCRIPTION: Places a blue line segment connecting (235, 220) to (62, 11).
; PLAN: r0=235(x1), r1=220(y1), r2=62(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 220
LDI r2, 62
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
