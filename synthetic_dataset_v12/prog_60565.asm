; DESCRIPTION: Places a magenta line segment connecting (40, 181) to (288, 114).
; PLAN: r0=40(x1), r1=181(y1), r2=288(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 181
LDI r2, 288
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
