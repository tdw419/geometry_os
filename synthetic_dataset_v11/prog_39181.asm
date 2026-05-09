; DESCRIPTION: Draws a red line from (226, 85) to (45, 216).
; PLAN: r0=226(x1), r1=85(y1), r2=45(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 85
LDI r2, 45
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
