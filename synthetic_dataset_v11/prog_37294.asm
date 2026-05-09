; DESCRIPTION: Places a magenta line segment connecting (47, 17) to (94, 241).
; PLAN: r0=47(x1), r1=17(y1), r2=94(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 17
LDI r2, 94
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
