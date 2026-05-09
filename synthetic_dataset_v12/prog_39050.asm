; DESCRIPTION: Draws a red line from (118, 52) to (478, 164).
; PLAN: r0=118(x1), r1=52(y1), r2=478(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 52
LDI r2, 478
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
