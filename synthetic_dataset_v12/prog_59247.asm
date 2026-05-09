; DESCRIPTION: Places a blue line segment connecting (73, 235) to (143, 200).
; PLAN: r0=73(x1), r1=235(y1), r2=143(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 235
LDI r2, 143
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
