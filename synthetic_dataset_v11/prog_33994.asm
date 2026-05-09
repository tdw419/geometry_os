; DESCRIPTION: Places a magenta line segment connecting (214, 45) to (26, 140).
; PLAN: r0=214(x1), r1=45(y1), r2=26(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 45
LDI r2, 26
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
