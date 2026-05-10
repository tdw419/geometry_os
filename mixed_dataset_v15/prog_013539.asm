; DESCRIPTION: Composite: Places a magenta circle of radius 30 at center (130, 77) then Sets a single white pixel at (214, 131).
; PLAN: r0=130(x), r1=77(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 77
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
