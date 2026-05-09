; DESCRIPTION: Composite: Creates a yellow circular shape at (90, 70) with radius 17 then Places a white dot at position (182, 216).
; PLAN: r0=90(x), r1=70(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=216(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 70
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 216
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
