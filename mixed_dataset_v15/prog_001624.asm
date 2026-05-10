; DESCRIPTION: Places a blue line segment connecting (26, 181) to (220, 177).
; PLAN: r0=26(x1), r1=181(y1), r2=220(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 181
LDI r2, 220
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
