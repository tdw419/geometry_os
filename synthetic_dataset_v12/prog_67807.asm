; DESCRIPTION: Places a magenta line segment connecting (237, 72) to (60, 47).
; PLAN: r0=237(x1), r1=72(y1), r2=60(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 72
LDI r2, 60
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
