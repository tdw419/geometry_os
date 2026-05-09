; DESCRIPTION: Draws a magenta line from (463, 85) to (225, 118).
; PLAN: r0=463(x1), r1=85(y1), r2=225(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 85
LDI r2, 225
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
