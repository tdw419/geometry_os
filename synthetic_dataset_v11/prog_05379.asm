; DESCRIPTION: Places a magenta line segment connecting (250, 9) to (179, 134).
; PLAN: r0=250(x1), r1=9(y1), r2=179(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 9
LDI r2, 179
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
