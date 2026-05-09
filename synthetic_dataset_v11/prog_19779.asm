; DESCRIPTION: Places a magenta line segment connecting (137, 164) to (22, 2).
; PLAN: r0=137(x1), r1=164(y1), r2=22(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 164
LDI r2, 22
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
