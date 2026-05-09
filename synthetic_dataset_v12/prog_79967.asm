; DESCRIPTION: Places a magenta line segment connecting (373, 72) to (45, 96).
; PLAN: r0=373(x1), r1=72(y1), r2=45(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 72
LDI r2, 45
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
