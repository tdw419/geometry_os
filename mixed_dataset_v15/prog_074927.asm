; DESCRIPTION: Draws a black line from (462, 142) to (407, 181).
; PLAN: r0=462(x1), r1=142(y1), r2=407(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 142
LDI r2, 407
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
