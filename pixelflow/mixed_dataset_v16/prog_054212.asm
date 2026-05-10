; DESCRIPTION: Composite: Creates a white circular shape at (277, 176) with radius 75 then Places a yellow dot at position (33, 9).
; PLAN: r0=277(x), r1=176(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 176
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
