; DESCRIPTION: Draws a red line from (58, 105) to (458, 71).
; PLAN: r0=58(x1), r1=105(y1), r2=458(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 105
LDI r2, 458
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
