; DESCRIPTION: Composite: . Then Sets a single orange pixel at (190, 252). Then Draws a white circle centered at (96, 180) with radius 76.
; PLAN: r0=190(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=180(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (190, 252).
; PLAN: r0=190(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (96, 180) with radius 76.
; PLAN: r0=96(x), r1=180(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 180
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
