; DESCRIPTION: Places a blue line segment connecting (431, 173) to (311, 206).
; PLAN: r0=431(x1), r1=173(y1), r2=311(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 173
LDI r2, 311
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
