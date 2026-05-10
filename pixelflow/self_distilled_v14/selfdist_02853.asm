; DESCRIPTION: Draws a cyan line from (301, 77) to (315, 190).
; PLAN: r0=301(x1), r1=77(y1), r2=315(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 77
LDI r2, 315
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
