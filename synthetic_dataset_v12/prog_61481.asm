; DESCRIPTION: Composite: Draws a yellow circle centered at (413, 177) with radius 33 then Places a cyan dot at position (24, 77).
; PLAN: r0=413(x), r1=177(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=77(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 177
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 77
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
