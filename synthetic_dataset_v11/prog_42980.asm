; DESCRIPTION: Places a magenta line segment connecting (86, 10) to (114, 112).
; PLAN: r0=86(x1), r1=10(y1), r2=114(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 10
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
