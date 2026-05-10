; DESCRIPTION: Composite: Sets a single white pixel at (362, 164) then Renders a black disk with center (279, 131) and radius 18.
; PLAN: r0=362(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=131(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 131
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
