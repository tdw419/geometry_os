; DESCRIPTION: Places a magenta line segment connecting (461, 199) to (438, 68).
; PLAN: r0=461(x1), r1=199(y1), r2=438(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 199
LDI r2, 438
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
