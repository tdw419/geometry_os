; DESCRIPTION: Places a magenta line segment connecting (124, 94) to (180, 3).
; PLAN: r0=124(x1), r1=94(y1), r2=180(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 94
LDI r2, 180
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
