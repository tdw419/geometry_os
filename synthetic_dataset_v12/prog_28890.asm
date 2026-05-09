; DESCRIPTION: Places a black line segment connecting (109, 97) to (433, 190).
; PLAN: r0=109(x1), r1=97(y1), r2=433(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 97
LDI r2, 433
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
