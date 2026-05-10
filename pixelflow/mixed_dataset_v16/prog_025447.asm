; DESCRIPTION: Composite: Places a white circle of radius 22 at center (93, 111) then Places a yellow dot at position (61, 1).
; PLAN: r0=93(x), r1=111(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=1(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 111
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 1
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
