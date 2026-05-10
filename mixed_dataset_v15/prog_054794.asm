; DESCRIPTION: Composite: Sets a single orange pixel at (301, 85) then Places a cyan circle of radius 78 at center (174, 153).
; PLAN: r0=301(x), r1=85(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=153(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 85
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 174
LDI r6, 153
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
