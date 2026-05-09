; DESCRIPTION: Places a black line segment connecting (68, 14) to (80, 190).
; PLAN: r0=68(x1), r1=14(y1), r2=80(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 14
LDI r2, 80
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
