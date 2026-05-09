; DESCRIPTION: Composite: Draws a blue circle centered at (145, 115) with radius 14 then Places a orange dot at position (298, 15).
; PLAN: r0=145(x), r1=115(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=15(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 115
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 15
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
