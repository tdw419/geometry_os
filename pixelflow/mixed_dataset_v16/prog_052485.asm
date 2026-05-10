; DESCRIPTION: Draws a black line from (24, 41) to (169, 39).
; PLAN: r0=24(x1), r1=41(y1), r2=169(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 41
LDI r2, 169
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
