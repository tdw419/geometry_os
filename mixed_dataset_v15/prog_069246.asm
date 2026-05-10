; DESCRIPTION: Places a magenta line segment connecting (440, 109) to (306, 120).
; PLAN: r0=440(x1), r1=109(y1), r2=306(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 109
LDI r2, 306
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
