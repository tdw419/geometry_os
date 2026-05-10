; DESCRIPTION: Composite: Places a cyan circle of radius 54 at center (86, 106) then Sets a single orange pixel at (167, 134).
; PLAN: r0=86(x), r1=106(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=134(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 106
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 134
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
