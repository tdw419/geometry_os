; DESCRIPTION: Places a magenta line segment connecting (61, 1) to (24, 117).
; PLAN: r0=61(x1), r1=1(y1), r2=24(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 1
LDI r2, 24
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
