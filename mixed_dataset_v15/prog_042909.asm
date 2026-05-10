; DESCRIPTION: Composite: Renders a red disk with center (123, 198) and radius 17 then Places a black dot at position (177, 39).
; PLAN: r0=123(x), r1=198(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=39(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 198
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 39
LDI r7, 0x000000
PSET r5, r6, r7
HALT
