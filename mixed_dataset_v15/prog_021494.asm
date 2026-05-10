; DESCRIPTION: Places a magenta line segment connecting (288, 243) to (390, 102).
; PLAN: r0=288(x1), r1=243(y1), r2=390(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 243
LDI r2, 390
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
