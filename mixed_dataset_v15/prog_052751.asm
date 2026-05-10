; DESCRIPTION: Places a magenta line segment connecting (213, 89) to (364, 163).
; PLAN: r0=213(x1), r1=89(y1), r2=364(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 89
LDI r2, 364
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
