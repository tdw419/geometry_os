; DESCRIPTION: Composite: Draws a red circle centered at (324, 151) with radius 44 then Sets a single cyan pixel at (234, 190).
; PLAN: r0=324(x), r1=151(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 151
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
