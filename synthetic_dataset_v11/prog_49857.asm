; DESCRIPTION: Places a magenta line segment connecting (55, 236) to (66, 205).
; PLAN: r0=55(x1), r1=236(y1), r2=66(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 236
LDI r2, 66
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
