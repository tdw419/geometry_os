; DESCRIPTION: Composite: Places a white circle of radius 71 at center (86, 170) then Places a white dot at position (164, 162).
; PLAN: r0=86(x), r1=170(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 170
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
