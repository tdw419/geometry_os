; DESCRIPTION: Places a magenta line segment connecting (447, 107) to (3, 13).
; PLAN: r0=447(x1), r1=107(y1), r2=3(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 107
LDI r2, 3
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
