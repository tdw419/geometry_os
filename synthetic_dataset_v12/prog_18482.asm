; DESCRIPTION: Places a yellow circle of radius 10 at center (190, 143).
; PLAN: r0=190(x), r1=143(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 143
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
