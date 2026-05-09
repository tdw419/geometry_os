; DESCRIPTION: Places a magenta line segment connecting (195, 14) to (33, 63).
; PLAN: r0=195(x1), r1=14(y1), r2=33(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 14
LDI r2, 33
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
