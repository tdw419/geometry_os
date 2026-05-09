; DESCRIPTION: Composite: Places a purple circle of radius 77 at center (234, 149) then Places a black dot at position (299, 29).
; PLAN: r0=234(x), r1=149(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 149
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
HALT
