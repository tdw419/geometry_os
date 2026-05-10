; DESCRIPTION: Composite: Creates a red circular shape at (103, 53) with radius 47 then Places a purple dot at position (130, 90).
; PLAN: r0=103(x), r1=53(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 53
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
