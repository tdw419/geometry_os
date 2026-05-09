; DESCRIPTION: Places a blue line segment connecting (470, 235) to (500, 141).
; PLAN: r0=470(x1), r1=235(y1), r2=500(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 235
LDI r2, 500
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
