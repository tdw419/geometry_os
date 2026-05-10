; DESCRIPTION: Places a black line segment connecting (407, 21) to (259, 190).
; PLAN: r0=407(x1), r1=21(y1), r2=259(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 21
LDI r2, 259
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
