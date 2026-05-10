; DESCRIPTION: Places a magenta line segment connecting (120, 170) to (343, 29).
; PLAN: r0=120(x1), r1=170(y1), r2=343(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 170
LDI r2, 343
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
