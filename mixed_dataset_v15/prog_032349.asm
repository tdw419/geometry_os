; DESCRIPTION: Draws a red line from (223, 66) to (119, 19).
; PLAN: r0=223(x1), r1=66(y1), r2=119(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 66
LDI r2, 119
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
