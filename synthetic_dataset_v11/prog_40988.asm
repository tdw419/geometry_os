; DESCRIPTION: Draws a black line from (4, 189) to (159, 233).
; PLAN: r0=4(x1), r1=189(y1), r2=159(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 189
LDI r2, 159
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
