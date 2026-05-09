; DESCRIPTION: Draws a red line from (139, 13) to (190, 250).
; PLAN: r0=139(x1), r1=13(y1), r2=190(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 13
LDI r2, 190
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
