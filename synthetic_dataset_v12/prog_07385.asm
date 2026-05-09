; DESCRIPTION: Draws a magenta line from (98, 29) to (505, 211).
; PLAN: r0=98(x1), r1=29(y1), r2=505(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 29
LDI r2, 505
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
