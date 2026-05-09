; DESCRIPTION: Places a magenta line segment connecting (48, 72) to (483, 26).
; PLAN: r0=48(x1), r1=72(y1), r2=483(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 72
LDI r2, 483
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
