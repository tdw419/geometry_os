; DESCRIPTION: Draws a magenta line from (323, 105) to (435, 172).
; PLAN: r0=323(x1), r1=105(y1), r2=435(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 105
LDI r2, 435
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
