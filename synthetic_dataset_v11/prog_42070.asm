; DESCRIPTION: Places a blue line segment connecting (206, 236) to (235, 200).
; PLAN: r0=206(x1), r1=236(y1), r2=235(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 236
LDI r2, 235
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
