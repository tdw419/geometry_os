; DESCRIPTION: Places a blue line segment connecting (171, 153) to (392, 112).
; PLAN: r0=171(x1), r1=153(y1), r2=392(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 153
LDI r2, 392
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
