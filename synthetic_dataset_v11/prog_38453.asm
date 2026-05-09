; DESCRIPTION: Draws a black line from (132, 52) to (159, 248).
; PLAN: r0=132(x1), r1=52(y1), r2=159(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 52
LDI r2, 159
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
