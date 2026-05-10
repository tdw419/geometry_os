; DESCRIPTION: Places a black line segment connecting (190, 34) to (369, 6).
; PLAN: r0=190(x1), r1=34(y1), r2=369(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 34
LDI r2, 369
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
