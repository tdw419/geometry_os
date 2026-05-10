; DESCRIPTION: Places a magenta line segment connecting (440, 133) to (259, 34).
; PLAN: r0=440(x1), r1=133(y1), r2=259(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 133
LDI r2, 259
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
