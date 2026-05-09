; DESCRIPTION: Places a magenta line segment connecting (483, 10) to (91, 29).
; PLAN: r0=483(x1), r1=10(y1), r2=91(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 10
LDI r2, 91
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
