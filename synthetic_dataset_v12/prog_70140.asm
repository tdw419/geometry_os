; DESCRIPTION: Composite: Places a black dot at position (132, 159) then Places a yellow circle of radius 35 at center (250, 137).
; PLAN: r0=132(x), r1=159(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=137(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 159
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 250
LDI r6, 137
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
