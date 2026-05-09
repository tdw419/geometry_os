; DESCRIPTION: Places a yellow circle of radius 32 at center (458, 203).
; PLAN: r0=458(x), r1=203(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 203
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
