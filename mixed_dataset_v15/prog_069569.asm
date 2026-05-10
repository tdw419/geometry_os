; DESCRIPTION: Composite: Places a blue circle of radius 54 at center (292, 111) then Places a white dot at position (378, 100).
; PLAN: r0=292(x), r1=111(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 111
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
