; DESCRIPTION: Draws a black line from (88, 91) to (26, 212).
; PLAN: r0=88(x1), r1=91(y1), r2=26(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 91
LDI r2, 26
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
