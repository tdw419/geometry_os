; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (352, 51) then Places a black dot at position (86, 56).
; PLAN: r0=352(x), r1=51(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=56(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 51
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 56
LDI r7, 0x000000
PSET r5, r6, r7
HALT
