; DESCRIPTION: Composite: Sets a single white pixel at (181, 56) then Places a blue circle of radius 63 at center (273, 67).
; PLAN: r0=181(x), r1=56(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=67(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 56
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 67
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
