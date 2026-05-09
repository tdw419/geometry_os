; DESCRIPTION: Composite: Places a yellow circle of radius 20 at center (366, 90) then Places a white dot at position (505, 139).
; PLAN: r0=366(x), r1=90(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=139(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 90
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 139
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
