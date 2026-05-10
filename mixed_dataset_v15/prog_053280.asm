; DESCRIPTION: Places a magenta line segment connecting (68, 109) to (170, 96).
; PLAN: r0=68(x1), r1=109(y1), r2=170(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 109
LDI r2, 170
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
