; DESCRIPTION: Places a green line segment connecting (153, 113) to (11, 190).
; PLAN: r0=153(x1), r1=113(y1), r2=11(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 113
LDI r2, 11
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
