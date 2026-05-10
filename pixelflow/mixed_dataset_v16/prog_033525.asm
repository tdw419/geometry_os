; DESCRIPTION: Places a magenta line segment connecting (388, 29) to (129, 15).
; PLAN: r0=388(x1), r1=29(y1), r2=129(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 29
LDI r2, 129
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
