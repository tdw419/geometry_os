; DESCRIPTION: Places a black line segment connecting (149, 190) to (118, 203).
; PLAN: r0=149(x1), r1=190(y1), r2=118(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 190
LDI r2, 118
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
