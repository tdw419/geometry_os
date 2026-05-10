; DESCRIPTION: Composite: Places a white circle of radius 37 at center (278, 215) then Places a white dot at position (34, 21).
; PLAN: r0=278(x), r1=215(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=21(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 215
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 21
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
