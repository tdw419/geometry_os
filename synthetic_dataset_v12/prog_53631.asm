; DESCRIPTION: Places a magenta line segment connecting (345, 116) to (353, 114).
; PLAN: r0=345(x1), r1=116(y1), r2=353(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 116
LDI r2, 353
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
