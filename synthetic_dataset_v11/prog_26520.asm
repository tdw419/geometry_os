; DESCRIPTION: Places a magenta line segment connecting (178, 142) to (93, 140).
; PLAN: r0=178(x1), r1=142(y1), r2=93(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 142
LDI r2, 93
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
