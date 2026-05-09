; DESCRIPTION: Places a magenta line segment connecting (149, 244) to (134, 229).
; PLAN: r0=149(x1), r1=244(y1), r2=134(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 244
LDI r2, 134
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
