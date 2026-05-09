; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (190, 47) with radius 43. Then Sets a single orange pixel at (27, 55).
; PLAN: r0=190(x), r1=47(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (190, 47) with radius 43.
; PLAN: r0=190(x), r1=47(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 47
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (27, 55).
; PLAN: r0=27(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
