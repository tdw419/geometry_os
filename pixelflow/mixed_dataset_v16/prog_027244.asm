; DESCRIPTION: Composite: Draws a orange circle centered at (327, 166) with radius 57 then Places a yellow dot at position (457, 190).
; PLAN: r0=327(x), r1=166(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=190(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 166
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 190
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
