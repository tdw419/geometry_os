; DESCRIPTION: Places a magenta line segment connecting (160, 103) to (457, 79).
; PLAN: r0=160(x1), r1=103(y1), r2=457(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 103
LDI r2, 457
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
