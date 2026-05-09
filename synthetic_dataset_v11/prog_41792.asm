; DESCRIPTION: Renders a yellow line between points (126, 76) and (169, 190).
; PLAN: r0=126(x1), r1=76(y1), r2=169(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 76
LDI r2, 169
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
