; DESCRIPTION: Draws a magenta line from (498, 118) to (115, 60).
; PLAN: r0=498(x1), r1=118(y1), r2=115(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 118
LDI r2, 115
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
