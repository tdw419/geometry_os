; DESCRIPTION: Places a magenta line segment connecting (220, 155) to (378, 48).
; PLAN: r0=220(x1), r1=155(y1), r2=378(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 155
LDI r2, 378
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
