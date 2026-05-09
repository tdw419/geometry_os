; DESCRIPTION: Composite: Places a black circle of radius 66 at center (271, 156) then Places a purple dot at position (387, 202).
; PLAN: r0=271(x), r1=156(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 156
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
