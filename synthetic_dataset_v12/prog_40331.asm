; DESCRIPTION: Composite: Places a cyan circle of radius 53 at center (251, 130) then Places a magenta dot at position (334, 144).
; PLAN: r0=251(x), r1=130(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=144(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 130
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 144
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
