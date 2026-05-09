; DESCRIPTION: Places a magenta line segment connecting (141, 99) to (194, 108).
; PLAN: r0=141(x1), r1=99(y1), r2=194(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 99
LDI r2, 194
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
