; DESCRIPTION: Places a magenta line segment connecting (36, 216) to (30, 32).
; PLAN: r0=36(x1), r1=216(y1), r2=30(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 216
LDI r2, 30
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
