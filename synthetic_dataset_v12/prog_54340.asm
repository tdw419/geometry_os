; DESCRIPTION: Draws a red line from (351, 180) to (478, 71).
; PLAN: r0=351(x1), r1=180(y1), r2=478(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 180
LDI r2, 478
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
