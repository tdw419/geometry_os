; DESCRIPTION: Composite: Places a black dot at position (366, 219) then Places a red circle of radius 47 at center (254, 71).
; PLAN: r0=366(x), r1=219(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=71(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 219
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 71
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
