; DESCRIPTION: Places a black circle of radius 43 at center (70, 190).
; PLAN: r0=70(x), r1=190(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 190
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
