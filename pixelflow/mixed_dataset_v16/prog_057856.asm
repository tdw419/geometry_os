; DESCRIPTION: Places a magenta line segment connecting (507, 121) to (135, 185).
; PLAN: r0=507(x1), r1=121(y1), r2=135(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 121
LDI r2, 135
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
