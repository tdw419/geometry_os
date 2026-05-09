; DESCRIPTION: Places a black line segment connecting (262, 110) to (177, 190).
; PLAN: r0=262(x1), r1=110(y1), r2=177(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 110
LDI r2, 177
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
