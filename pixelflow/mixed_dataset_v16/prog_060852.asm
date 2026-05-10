; DESCRIPTION: Places a magenta line segment connecting (264, 63) to (133, 148).
; PLAN: r0=264(x1), r1=63(y1), r2=133(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 63
LDI r2, 133
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
