; DESCRIPTION: Places a magenta line segment connecting (5, 65) to (45, 176).
; PLAN: r0=5(x1), r1=65(y1), r2=45(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 65
LDI r2, 45
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
