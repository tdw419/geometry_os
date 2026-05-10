; DESCRIPTION: Composite: Draws a cyan circle centered at (315, 164) with radius 47 then Places a white dot at position (437, 6).
; PLAN: r0=315(x), r1=164(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=6(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 164
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 6
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
