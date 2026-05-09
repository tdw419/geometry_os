; DESCRIPTION: Composite: Creates a blue circular shape at (237, 53) with radius 29 then Places a purple dot at position (393, 57).
; PLAN: r0=237(x), r1=53(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 53
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
