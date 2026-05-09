; DESCRIPTION: Composite: Places a black dot at position (422, 23) then Places a yellow circle of radius 29 at center (478, 204).
; PLAN: r0=422(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=204(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 204
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
