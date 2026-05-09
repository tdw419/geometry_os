; DESCRIPTION: Places a blue line segment connecting (147, 37) to (107, 190).
; PLAN: r0=147(x1), r1=37(y1), r2=107(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 37
LDI r2, 107
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
