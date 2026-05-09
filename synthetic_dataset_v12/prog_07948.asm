; DESCRIPTION: Composite: Draws a cyan circle centered at (123, 109) with radius 14 then Places a yellow dot at position (454, 195).
; PLAN: r0=123(x), r1=109(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=195(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 109
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 195
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
