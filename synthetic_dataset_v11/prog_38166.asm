; DESCRIPTION: Places a magenta line segment connecting (0, 38) to (216, 64).
; PLAN: r0=0(x1), r1=38(y1), r2=216(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 38
LDI r2, 216
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
