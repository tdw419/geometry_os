; DESCRIPTION: Places a black line segment connecting (18, 64) to (130, 190).
; PLAN: r0=18(x1), r1=64(y1), r2=130(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 64
LDI r2, 130
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
