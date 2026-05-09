; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (120, 141) then Places a purple dot at position (454, 139).
; PLAN: r0=120(x), r1=141(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=139(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 141
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 139
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
