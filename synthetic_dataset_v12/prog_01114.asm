; DESCRIPTION: Places a magenta line segment connecting (432, 251) to (440, 93).
; PLAN: r0=432(x1), r1=251(y1), r2=440(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 251
LDI r2, 440
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
