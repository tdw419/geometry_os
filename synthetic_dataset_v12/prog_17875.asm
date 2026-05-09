; DESCRIPTION: Places a black line segment connecting (190, 169) to (365, 84).
; PLAN: r0=190(x1), r1=169(y1), r2=365(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 169
LDI r2, 365
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
