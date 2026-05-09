; DESCRIPTION: Composite: Places a yellow circle of radius 37 at center (92, 128) then Sets a single white pixel at (312, 16).
; PLAN: r0=92(x), r1=128(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 128
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
