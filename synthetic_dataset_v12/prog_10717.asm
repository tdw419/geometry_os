; DESCRIPTION: Composite: Places a yellow circle of radius 53 at center (238, 189) then Places a red dot at position (147, 235).
; PLAN: r0=238(x), r1=189(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=235(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 189
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 235
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
