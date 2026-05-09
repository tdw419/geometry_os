; DESCRIPTION: Draws a yellow line from (22, 142) to (106, 43).
; PLAN: r0=22(x1), r1=142(y1), r2=106(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 142
LDI r2, 106
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
