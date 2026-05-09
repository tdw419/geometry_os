; DESCRIPTION: Places a magenta line segment connecting (251, 226) to (89, 166).
; PLAN: r0=251(x1), r1=226(y1), r2=89(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 226
LDI r2, 89
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
