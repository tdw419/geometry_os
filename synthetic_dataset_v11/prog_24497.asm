; DESCRIPTION: Draws a magenta line from (180, 229) to (115, 130).
; PLAN: r0=180(x1), r1=229(y1), r2=115(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 229
LDI r2, 115
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
