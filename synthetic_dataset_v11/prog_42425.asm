; DESCRIPTION: Places a magenta line segment connecting (16, 191) to (141, 25).
; PLAN: r0=16(x1), r1=191(y1), r2=141(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 191
LDI r2, 141
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
