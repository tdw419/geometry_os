; DESCRIPTION: Places a magenta line segment connecting (477, 26) to (435, 193).
; PLAN: r0=477(x1), r1=26(y1), r2=435(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 26
LDI r2, 435
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
