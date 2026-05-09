; DESCRIPTION: Places a blue line segment connecting (135, 160) to (505, 235).
; PLAN: r0=135(x1), r1=160(y1), r2=505(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 160
LDI r2, 505
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
