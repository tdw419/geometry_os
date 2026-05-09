; DESCRIPTION: Places a magenta line segment connecting (265, 85) to (208, 44).
; PLAN: r0=265(x1), r1=85(y1), r2=208(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 85
LDI r2, 208
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
