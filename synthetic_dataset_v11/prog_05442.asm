; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (90, 137) with radius 61. Then Sets a single purple pixel at (95, 54).
; PLAN: r0=90(x), r1=137(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=95(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (90, 137) with radius 61.
; PLAN: r0=90(x), r1=137(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 137
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (95, 54).
; PLAN: r0=95(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
