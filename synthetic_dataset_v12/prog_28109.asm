; DESCRIPTION: Renders a yellow line between points (438, 59) and (190, 212).
; PLAN: r0=438(x1), r1=59(y1), r2=190(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 59
LDI r2, 190
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
