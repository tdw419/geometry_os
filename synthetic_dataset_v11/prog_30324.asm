; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (146, 153) with radius 71. Then Sets a single orange pixel at (230, 115).
; PLAN: r0=146(x), r1=153(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=230(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (146, 153) with radius 71.
; PLAN: r0=146(x), r1=153(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 153
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (230, 115).
; PLAN: r0=230(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
