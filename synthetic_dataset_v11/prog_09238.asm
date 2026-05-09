; DESCRIPTION: Composite: . Then Places a white circle of radius 34 at center (106, 116). Then Sets a single red pixel at (116, 6).
; PLAN: r0=106(x), r1=116(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 34 at center (106, 116).
; PLAN: r0=106(x), r1=116(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 116
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (116, 6).
; PLAN: r0=116(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
