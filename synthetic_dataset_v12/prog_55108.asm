; DESCRIPTION: Renders a green line between points (457, 190) and (78, 218).
; PLAN: r0=457(x1), r1=190(y1), r2=78(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 190
LDI r2, 78
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
