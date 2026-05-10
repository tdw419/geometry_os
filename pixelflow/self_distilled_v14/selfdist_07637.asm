; DESCRIPTION: Draws a red line from (358, 149) to (141, 190).
; PLAN: r0=358(x1), r1=149(y1), r2=141(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 149
LDI r2, 141
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
