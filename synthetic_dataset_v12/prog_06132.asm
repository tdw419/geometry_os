; DESCRIPTION: Places a magenta line segment connecting (35, 71) to (94, 8).
; PLAN: r0=35(x1), r1=71(y1), r2=94(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 71
LDI r2, 94
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
