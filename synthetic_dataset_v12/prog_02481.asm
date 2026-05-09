; DESCRIPTION: Renders a green line between points (458, 80) and (116, 190).
; PLAN: r0=458(x1), r1=80(y1), r2=116(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 80
LDI r2, 116
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
