; DESCRIPTION: Composite: Places a orange dot at position (482, 9) then Places a red circle of radius 13 at center (439, 18).
; PLAN: r0=482(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=18(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 439
LDI r6, 18
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
