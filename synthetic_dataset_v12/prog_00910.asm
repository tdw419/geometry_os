; DESCRIPTION: Composite: Places a green circle of radius 65 at center (171, 77) then Places a purple dot at position (397, 69).
; PLAN: r0=171(x), r1=77(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=69(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 77
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 69
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
