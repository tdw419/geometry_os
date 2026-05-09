; DESCRIPTION: Places a magenta line segment connecting (3, 37) to (52, 179).
; PLAN: r0=3(x1), r1=37(y1), r2=52(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 37
LDI r2, 52
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
