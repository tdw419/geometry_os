; DESCRIPTION: Composite: Creates a orange circular shape at (110, 222) with radius 26 then Places a black dot at position (387, 233).
; PLAN: r0=110(x), r1=222(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=233(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 222
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 233
LDI r7, 0x000000
PSET r5, r6, r7
HALT
