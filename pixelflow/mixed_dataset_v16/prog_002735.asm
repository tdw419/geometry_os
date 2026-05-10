; DESCRIPTION: Composite: Places a magenta circle of radius 42 at center (380, 175) then Places a orange dot at position (188, 2).
; PLAN: r0=380(x), r1=175(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=2(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 175
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 2
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
