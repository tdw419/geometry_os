; DESCRIPTION: Draws a red line from (19, 105) to (424, 188).
; PLAN: r0=19(x1), r1=105(y1), r2=424(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 105
LDI r2, 424
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
