; DESCRIPTION: Places a orange line segment connecting (52, 243) to (14, 190).
; PLAN: r0=52(x1), r1=243(y1), r2=14(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 243
LDI r2, 14
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
