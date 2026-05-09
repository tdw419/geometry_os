; DESCRIPTION: Draws a magenta line from (38, 89) to (75, 8).
; PLAN: r0=38(x1), r1=89(y1), r2=75(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 89
LDI r2, 75
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
