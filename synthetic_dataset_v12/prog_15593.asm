; DESCRIPTION: Draws a red line from (77, 184) to (325, 49).
; PLAN: r0=77(x1), r1=184(y1), r2=325(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 184
LDI r2, 325
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
