; DESCRIPTION: Places a magenta line segment connecting (334, 161) to (483, 29).
; PLAN: r0=334(x1), r1=161(y1), r2=483(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 161
LDI r2, 483
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
