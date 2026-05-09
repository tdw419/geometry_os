; DESCRIPTION: Places a magenta line segment connecting (21, 7) to (22, 178).
; PLAN: r0=21(x1), r1=7(y1), r2=22(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 7
LDI r2, 22
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
