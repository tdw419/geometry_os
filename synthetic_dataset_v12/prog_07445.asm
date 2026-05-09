; DESCRIPTION: Composite: Places a blue circle of radius 64 at center (108, 139) then Places a purple dot at position (225, 125).
; PLAN: r0=108(x), r1=139(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=125(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 139
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 125
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
