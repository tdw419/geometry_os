; DESCRIPTION: Composite: Creates a magenta circular shape at (150, 46) with radius 24 then Sets a single cyan pixel at (19, 114).
; PLAN: r0=150(x), r1=46(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=114(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 46
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 114
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
