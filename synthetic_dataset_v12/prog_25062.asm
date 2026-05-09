; DESCRIPTION: Composite: Creates a orange circular shape at (222, 175) with radius 65 then Places a yellow dot at position (197, 155).
; PLAN: r0=222(x), r1=175(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=155(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 175
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 155
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
