; DESCRIPTION: Composite: Creates a purple circular shape at (436, 83) with radius 72 then Places a orange dot at position (344, 255).
; PLAN: r0=436(x), r1=83(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 83
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
