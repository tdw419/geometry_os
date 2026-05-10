; DESCRIPTION: Composite: Renders a green disk with center (175, 114) and radius 43 then Places a orange dot at position (0, 15).
; PLAN: r0=175(x), r1=114(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=15(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 114
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 15
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
