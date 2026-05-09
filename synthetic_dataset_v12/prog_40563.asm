; DESCRIPTION: Places a magenta line segment connecting (270, 231) to (472, 148).
; PLAN: r0=270(x1), r1=231(y1), r2=472(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 231
LDI r2, 472
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
