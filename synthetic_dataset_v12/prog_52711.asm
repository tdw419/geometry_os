; DESCRIPTION: Draws a black line from (15, 46) to (44, 159).
; PLAN: r0=15(x1), r1=46(y1), r2=44(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 46
LDI r2, 44
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
