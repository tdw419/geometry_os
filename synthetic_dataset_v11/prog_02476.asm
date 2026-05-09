; DESCRIPTION: Draws a black line from (251, 159) to (199, 238).
; PLAN: r0=251(x1), r1=159(y1), r2=199(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 159
LDI r2, 199
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
