; DESCRIPTION: Composite: Places a yellow circle of radius 54 at center (85, 61) then Places a green dot at position (375, 214).
; PLAN: r0=85(x), r1=61(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=214(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 61
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 214
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
