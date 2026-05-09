; DESCRIPTION: Draws a red line from (478, 205) to (342, 190).
; PLAN: r0=478(x1), r1=205(y1), r2=342(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 205
LDI r2, 342
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
