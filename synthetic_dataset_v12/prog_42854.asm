; DESCRIPTION: Composite: Draws a orange circle centered at (254, 108) with radius 15 then Places a cyan dot at position (211, 219).
; PLAN: r0=254(x), r1=108(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=219(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 108
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 219
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
