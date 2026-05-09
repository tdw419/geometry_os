; DESCRIPTION: Renders a black line between points (231, 175) and (119, 190).
; PLAN: r0=231(x1), r1=175(y1), r2=119(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 175
LDI r2, 119
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
