; DESCRIPTION: Places a green line segment connecting (234, 100) to (105, 190).
; PLAN: r0=234(x1), r1=100(y1), r2=105(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 100
LDI r2, 105
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
