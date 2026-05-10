; DESCRIPTION: Places a yellow circle of radius 51 at center (177, 190).
; PLAN: r0=177(x), r1=190(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 190
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
