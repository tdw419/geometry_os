; DESCRIPTION: Places a purple circle of radius 77 at center (190, 95).
; PLAN: r0=190(x), r1=95(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 95
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
