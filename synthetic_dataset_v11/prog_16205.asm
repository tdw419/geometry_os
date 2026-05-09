; DESCRIPTION: Draws a purple line from (244, 20) to (166, 41).
; PLAN: r0=244(x1), r1=20(y1), r2=166(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 20
LDI r2, 166
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
