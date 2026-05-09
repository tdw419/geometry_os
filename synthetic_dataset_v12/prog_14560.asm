; DESCRIPTION: Places a magenta line segment connecting (58, 22) to (72, 5).
; PLAN: r0=58(x1), r1=22(y1), r2=72(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 22
LDI r2, 72
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
