; DESCRIPTION: Composite: Places a black dot at position (299, 184) then Places a purple circle of radius 37 at center (260, 117).
; PLAN: r0=299(x), r1=184(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=117(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 184
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 117
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
