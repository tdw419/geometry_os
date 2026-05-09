; DESCRIPTION: Draws a black line from (144, 252) to (159, 244).
; PLAN: r0=144(x1), r1=252(y1), r2=159(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 252
LDI r2, 159
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
