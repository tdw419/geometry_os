; DESCRIPTION: Places a magenta line segment connecting (157, 219) to (24, 169).
; PLAN: r0=157(x1), r1=219(y1), r2=24(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 219
LDI r2, 24
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
