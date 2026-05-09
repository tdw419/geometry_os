; DESCRIPTION: Places a magenta line segment connecting (94, 52) to (13, 57).
; PLAN: r0=94(x1), r1=52(y1), r2=13(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 52
LDI r2, 13
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
