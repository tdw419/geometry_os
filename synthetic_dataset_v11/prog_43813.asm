; DESCRIPTION: Composite: . Then Sets a single purple pixel at (31, 13). Then Renders a red disk with center (116, 186) and radius 49.
; PLAN: r0=31(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=116(x), r1=186(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (31, 13).
; PLAN: r0=31(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (116, 186) and radius 49.
; PLAN: r0=116(x), r1=186(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 186
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
