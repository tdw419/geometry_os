; DESCRIPTION: Places a magenta line segment connecting (244, 96) to (22, 168).
; PLAN: r0=244(x1), r1=96(y1), r2=22(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 96
LDI r2, 22
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
