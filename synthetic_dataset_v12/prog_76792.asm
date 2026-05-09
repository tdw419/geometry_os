; DESCRIPTION: Composite: Places a black circle of radius 69 at center (116, 171) then Places a magenta dot at position (325, 120).
; PLAN: r0=116(x), r1=171(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=120(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 171
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 120
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
