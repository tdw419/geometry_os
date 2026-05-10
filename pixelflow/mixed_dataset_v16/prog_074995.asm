; DESCRIPTION: Draws a magenta line from (420, 118) to (44, 148).
; PLAN: r0=420(x1), r1=118(y1), r2=44(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 118
LDI r2, 44
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
