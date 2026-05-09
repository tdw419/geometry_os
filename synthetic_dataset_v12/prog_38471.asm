; DESCRIPTION: Draws a black line from (169, 105) to (91, 30).
; PLAN: r0=169(x1), r1=105(y1), r2=91(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 105
LDI r2, 91
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
