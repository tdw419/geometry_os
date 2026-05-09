; DESCRIPTION: Draws a black line from (157, 75) to (88, 206).
; PLAN: r0=157(x1), r1=75(y1), r2=88(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 75
LDI r2, 88
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
