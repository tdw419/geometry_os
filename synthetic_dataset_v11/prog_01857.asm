; DESCRIPTION: Draws a black line from (70, 105) to (155, 174).
; PLAN: r0=70(x1), r1=105(y1), r2=155(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 105
LDI r2, 155
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
