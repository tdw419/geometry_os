; DESCRIPTION: Places a magenta line segment connecting (256, 26) to (378, 70).
; PLAN: r0=256(x1), r1=26(y1), r2=378(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 26
LDI r2, 378
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
