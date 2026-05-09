; DESCRIPTION: Places a magenta line segment connecting (10, 139) to (129, 193).
; PLAN: r0=10(x1), r1=139(y1), r2=129(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 139
LDI r2, 129
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
