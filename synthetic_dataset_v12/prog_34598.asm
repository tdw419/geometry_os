; DESCRIPTION: Places a magenta line segment connecting (473, 30) to (11, 8).
; PLAN: r0=473(x1), r1=30(y1), r2=11(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 30
LDI r2, 11
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
