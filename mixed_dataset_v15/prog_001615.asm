; DESCRIPTION: Draws a yellow line from (363, 190) to (317, 194).
; PLAN: r0=363(x1), r1=190(y1), r2=317(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 190
LDI r2, 317
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
