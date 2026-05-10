; DESCRIPTION: Composite: Renders a green disk with center (428, 134) and radius 64 then Places a yellow dot at position (495, 77).
; PLAN: r0=428(x), r1=134(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x), r6=77(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 428
LDI r1, 134
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 77
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
