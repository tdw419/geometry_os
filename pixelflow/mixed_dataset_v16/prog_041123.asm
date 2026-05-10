; DESCRIPTION: Composite: Places a cyan circle of radius 11 at center (142, 69) then Sets a single blue pixel at (456, 167).
; PLAN: r0=142(x), r1=69(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=167(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 69
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 167
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
