; DESCRIPTION: Composite: Places a purple dot at position (209, 238) then Places a black circle of radius 53 at center (362, 75).
; PLAN: r0=209(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=75(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 75
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
