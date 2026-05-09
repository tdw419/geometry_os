; DESCRIPTION: Draws a black line from (169, 11) to (207, 2).
; PLAN: r0=169(x1), r1=11(y1), r2=207(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 11
LDI r2, 207
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
