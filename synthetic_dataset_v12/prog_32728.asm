; DESCRIPTION: Composite: Places a purple dot at position (29, 131) then Places a green circle of radius 62 at center (259, 139).
; PLAN: r0=29(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=139(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 139
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
