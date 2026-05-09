; DESCRIPTION: Places a magenta line segment connecting (72, 200) to (380, 147).
; PLAN: r0=72(x1), r1=200(y1), r2=380(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 200
LDI r2, 380
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
