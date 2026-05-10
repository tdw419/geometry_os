; DESCRIPTION: Places a yellow line segment connecting (126, 6) to (56, 190).
; PLAN: r0=126(x1), r1=6(y1), r2=56(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 6
LDI r2, 56
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
