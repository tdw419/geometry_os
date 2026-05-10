; DESCRIPTION: Composite: Sets a single black pixel at (201, 163) then Places a blue circle of radius 32 at center (433, 164).
; PLAN: r0=201(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=164(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 433
LDI r6, 164
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
