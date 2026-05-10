; DESCRIPTION: Draws a magenta line from (89, 1) to (32, 94).
; PLAN: r0=89(x1), r1=1(y1), r2=32(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 1
LDI r2, 32
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
