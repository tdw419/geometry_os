; DESCRIPTION: Composite: Sets a single white pixel at (37, 236) then Renders a blue disk with center (312, 101) and radius 42.
; PLAN: r0=37(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=101(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 101
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
