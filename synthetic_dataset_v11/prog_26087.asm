; DESCRIPTION: Places a magenta line segment connecting (143, 2) to (25, 109).
; PLAN: r0=143(x1), r1=2(y1), r2=25(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 2
LDI r2, 25
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
