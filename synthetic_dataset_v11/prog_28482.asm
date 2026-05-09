; DESCRIPTION: Places a magenta line segment connecting (175, 140) to (161, 109).
; PLAN: r0=175(x1), r1=140(y1), r2=161(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 161
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
