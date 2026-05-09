; DESCRIPTION: Places a black line segment connecting (87, 106) to (61, 190).
; PLAN: r0=87(x1), r1=106(y1), r2=61(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 106
LDI r2, 61
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
