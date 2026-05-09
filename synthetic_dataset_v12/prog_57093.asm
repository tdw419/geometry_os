; DESCRIPTION: Draws a green line from (238, 119) to (468, 190).
; PLAN: r0=238(x1), r1=119(y1), r2=468(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 119
LDI r2, 468
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
