; DESCRIPTION: Places a white line segment connecting (119, 51) to (258, 190).
; PLAN: r0=119(x1), r1=51(y1), r2=258(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 51
LDI r2, 258
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
