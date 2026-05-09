; DESCRIPTION: Composite: Renders a orange disk with center (286, 142) and radius 54 then Places a cyan dot at position (412, 13).
; PLAN: r0=286(x), r1=142(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 142
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
