; DESCRIPTION: Draws a magenta line from (175, 97) to (142, 81).
; PLAN: r0=175(x1), r1=97(y1), r2=142(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 97
LDI r2, 142
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
