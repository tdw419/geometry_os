; DESCRIPTION: Places a orange line segment connecting (107, 62) to (45, 190).
; PLAN: r0=107(x1), r1=62(y1), r2=45(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 62
LDI r2, 45
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
