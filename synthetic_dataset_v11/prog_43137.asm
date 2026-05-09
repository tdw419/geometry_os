; DESCRIPTION: Places a green line segment connecting (10, 194) to (254, 190).
; PLAN: r0=10(x1), r1=194(y1), r2=254(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 194
LDI r2, 254
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
