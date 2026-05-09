; DESCRIPTION: Places a blue circle of radius 52 at center (238, 190).
; PLAN: r0=238(x), r1=190(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 190
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
