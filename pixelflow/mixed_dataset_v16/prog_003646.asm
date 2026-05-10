; DESCRIPTION: Composite: Places a yellow circle of radius 61 at center (221, 100) then Sets a single black pixel at (120, 151).
; PLAN: r0=221(x), r1=100(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=151(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 100
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 151
LDI r7, 0x000000
PSET r5, r6, r7
HALT
