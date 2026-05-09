; DESCRIPTION: Places a yellow line segment connecting (238, 79) to (190, 191).
; PLAN: r0=238(x1), r1=79(y1), r2=190(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 79
LDI r2, 190
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
