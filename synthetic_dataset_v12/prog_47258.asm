; DESCRIPTION: Draws a magenta line from (370, 181) to (44, 96).
; PLAN: r0=370(x1), r1=181(y1), r2=44(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 181
LDI r2, 44
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
