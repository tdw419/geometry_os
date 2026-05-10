; DESCRIPTION: Draws a black line from (470, 142) to (357, 118).
; PLAN: r0=470(x1), r1=142(y1), r2=357(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 142
LDI r2, 357
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
