; DESCRIPTION: Composite: Places a yellow dot at position (413, 218) then Places a black circle of radius 14 at center (131, 117).
; PLAN: r0=413(x), r1=218(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=117(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 218
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 131
LDI r6, 117
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
