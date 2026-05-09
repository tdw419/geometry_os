; DESCRIPTION: Draws a magenta line from (89, 180) to (46, 47).
; PLAN: r0=89(x1), r1=180(y1), r2=46(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 180
LDI r2, 46
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
