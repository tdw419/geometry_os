; DESCRIPTION: Places a magenta line segment connecting (366, 73) to (483, 125).
; PLAN: r0=366(x1), r1=73(y1), r2=483(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 73
LDI r2, 483
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
