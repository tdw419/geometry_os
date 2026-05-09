; DESCRIPTION: Draws a black line from (91, 88) to (246, 159).
; PLAN: r0=91(x1), r1=88(y1), r2=246(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 88
LDI r2, 246
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
