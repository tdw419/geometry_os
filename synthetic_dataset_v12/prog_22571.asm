; DESCRIPTION: Composite: Draws a yellow circle centered at (164, 160) with radius 74 then Places a orange dot at position (263, 9).
; PLAN: r0=164(x), r1=160(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=9(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 160
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 9
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
