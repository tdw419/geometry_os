; DESCRIPTION: Places a magenta line segment connecting (400, 140) to (81, 11).
; PLAN: r0=400(x1), r1=140(y1), r2=81(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 140
LDI r2, 81
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
