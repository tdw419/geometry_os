; DESCRIPTION: Draws a black line from (89, 83) to (157, 167).
; PLAN: r0=89(x1), r1=83(y1), r2=157(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 83
LDI r2, 157
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
