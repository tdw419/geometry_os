; DESCRIPTION: Places a black line segment connecting (299, 107) to (190, 238).
; PLAN: r0=299(x1), r1=107(y1), r2=190(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 107
LDI r2, 190
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
